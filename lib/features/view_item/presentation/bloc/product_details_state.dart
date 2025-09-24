import 'package:burget_app_ui/features/home/data/product_model.dart';

class ProductDetailsState {}

class InitState extends ProductDetailsState {}

class Loading extends ProductDetailsState {}

class Loaded extends ProductDetailsState {
  final List<ProductModel> product;

  Loaded({required this.product});
}

class Error extends ProductDetailsState {}
