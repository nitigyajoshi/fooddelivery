class ProductModel {
  String product_Name;
  String product_image;
  int? product_price;
  String productId;
  int? quantity;
  List<dynamic>? productunit;
  ProductModel(
      {this.productunit,
      this.quantity,
      required this.productId,
      required this.product_Name,
      required this.product_image,
      this.product_price});
}
