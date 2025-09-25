import 'package:burget_app_ui/features/home/data/product_model.dart';

class CartCalculator {
  static double calculateTotal(List<ProductModel> product) {
    return product.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
