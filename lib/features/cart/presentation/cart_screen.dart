import 'package:burget_app_ui/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_event.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_state.dart';
import 'package:burget_app_ui/features/check_out_page/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is Loaded) {
            return ListView.builder(
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                final product = state.product[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.pName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            context.read<CartBloc>().add(
                                              DecrementQuantityEvent(
                                                product: product,
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                        ),
                                        Text(
                                          "${product.quantity}",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            context.read<CartBloc>().add(
                                              IncrementQuantityEvent(
                                                product: product,
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.add_circle_outline),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                    DeleteAllEvent(product: product),
                                  );
                                },
                                icon: Icon(Icons.delete, size: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: Text("Your cart is empty"));
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 50, left: 16, right: 16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckOutScreen()),
              );
            },
            child: const Text("Check Out"),
          ),
        ),
      ),
    );
  }
}
