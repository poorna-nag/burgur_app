import 'package:burget_app_ui/features/home/data/product_model.dart';

abstract class ProductRepo {
  Future<List<ProductModel>> getproduct();
}
