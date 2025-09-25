import 'package:burget_app_ui/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_event.dart';
import 'package:burget_app_ui/features/cart/presentation/cart_screen.dart';
import 'package:burget_app_ui/features/home/data/product_model.dart';
import 'package:burget_app_ui/features/home/presentation/bloc/home_bloc.dart';
import 'package:burget_app_ui/features/home/presentation/bloc/home_event.dart';
import 'package:burget_app_ui/features/home/presentation/bloc/home_state.dart';
import 'package:burget_app_ui/features/view_item/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Icon(Icons.menu),
        title: Text("My Burgur App"),

        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              // context.read<CartBloc>().add(GoToCartEvent());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
            icon: Icon(Icons.shop_two),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            final product = state.product;
            return HomeScreenView(item: product);
          } else if (state is Error) {
            return Text('Product Fail To Loaded');
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  final List<ProductModel> item;
  const HomeScreenView({super.key, required this.item});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.item.length,
        itemBuilder: (context, index) {
          final product = widget.item[index];
          return GestureDetector(
            onTap: () {
              // context.read<HomeBloc>().add(ShowDetailPeoductEvent());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(product.imageUrl),
                  SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.pName,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {
                            context.read<CartBloc>().add(
                              GetCartProductEvent(product: widget.item[index]),
                            );
                          },
                          icon: Text(
                            "ADD",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
