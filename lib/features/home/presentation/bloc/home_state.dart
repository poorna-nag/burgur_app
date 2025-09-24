import 'package:burget_app_ui/features/home/data/product_model.dart';

class HomeState {}

class InitState extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<ProductModel> product;

  Loaded({required this.product});
}

class Error extends HomeState {}
