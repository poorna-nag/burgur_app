import 'package:burget_app_ui/features/home/data/product_model.dart';

class Event {}

class GetProductEvent extends Event {}

class AddToCartEvent extends Event {
  final ProductModel product;

  AddToCartEvent({required this.product});
}
