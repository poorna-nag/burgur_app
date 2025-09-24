class ProductModel {
  final String pName;
  final String imageUrl;
  final String details;
  final int productId;
  int quantity = 0;

  ProductModel({
    required this.pName,
    required this.imageUrl,
    required this.details,
    required this.productId,
  });
}
