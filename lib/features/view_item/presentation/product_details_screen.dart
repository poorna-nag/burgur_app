import 'package:burget_app_ui/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_event.dart';
import 'package:burget_app_ui/features/home/data/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Image.network(widget.product.imageUrl, fit: BoxFit.cover),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Text(
                        widget.product.pName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Details Of Your Food: ${widget.product.details}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                            GetCartProductEvent(product: widget.product),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${widget.product.pName} added to cart",
                              ),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Add to Cart"),
                      ),
                     
                    ],
                  ),
                  
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
//  class _ItemViewMorState extends StatefulWidget {
//   const _ItemViewMorState({super.key});

//   @override
//   State<_ItemViewMorState> createState() => __ItemViewMorStateState();
// }

// class __ItemViewMorStateState extends State<_ItemViewMorState> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//                 children: [
//                   Image.network(product.imageUrl),
//                   SizedBox(height: 5),

//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           product.pName,
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         IconButton.filled(
//                           onPressed: () {
//                             context.read<CartBloc>().add(
//                               GetCartProductEvent(product: widget.item[index]),
//                             );
//                           },
//                           icon: Text(
//                             "ADD",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//   }
// }