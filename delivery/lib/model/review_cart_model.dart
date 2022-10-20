class ReviewCartModel{
  String cartId;
String cartName;
String cartImage;
int ?cartPrice;
int ?cartQuantity;
List<dynamic> cartunit;
ReviewCartModel({
  required this.cartunit,
required this.cartName,required this.cartImage,required this.cartPrice,required this.cartId,required this.cartQuantity});

}