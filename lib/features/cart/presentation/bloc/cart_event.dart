import 'package:burget_app_ui/features/home/data/product_model.dart';

class CartEvent {}

class GetCartProductEvent extends CartEvent {
  final ProductModel product;

  GetCartProductEvent({required this.product});
}

class IncrementQuantityEvent extends CartEvent {
  final ProductModel product;

  IncrementQuantityEvent({required this.product});
}

class DecrementQuantityEvent extends CartEvent {
  final ProductModel product;

  DecrementQuantityEvent({required this.product});
}

class DeleteAllEvent extends CartEvent {
  final ProductModel product;

  DeleteAllEvent({required this.product});
}

class CartCheckOut extends CartEvent {}

class GoToCartEvent extends CartEvent {}
