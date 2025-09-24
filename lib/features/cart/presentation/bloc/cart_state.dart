import 'package:burget_app_ui/features/home/data/product_model.dart';

class CartState {}

class InitState extends CartState {}

class Loading extends CartState {}

class Loaded extends CartState {
  final List<ProductModel> product;

  Loaded({required this.product});
}

class IncrementState extends CartState {
  final List<ProductModel> product;

  IncrementState({required this.product});
}

class DecrementState extends CartState {
  final List<ProductModel> product;

  DecrementState({required this.product});
}

class Error extends CartState {}
