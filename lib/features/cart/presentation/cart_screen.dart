import 'package:burget_app_ui/core/app_util/cart_calculator.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_event.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_state.dart';
import 'package:burget_app_ui/features/check_out_page/presentation/check_out_screen.dart';
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
      appBar: AppBar(title: const Text("My Cart"), centerTitle: true),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is Loaded && state.product.isNotEmpty) {
            final cartTotal = CartCalculator.calculateTotal(state.product);

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.product.length,
                    itemBuilder: (context, index) {
                      final product = state.product[index];
                      final itemTotal = product.price * product.quantity;

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
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
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Quantity buttons
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
                                          icon: const Icon(
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
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$${itemTotal.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 16, 18, 16),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                        DeleteAllEvent(product: product),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 28,
                                      color: Color.fromARGB(255, 52, 50, 50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 90, 86, 86),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$${cartTotal.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 9, 9, 9),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckOutScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Proceed to Checkout",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return Center(
            child: Text(
              "Your cart is empty",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
