import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier{
  List<ReviewCartModel>review_cart_provider=[];
//get review data


  void getReviewCartData()async{

List<ReviewCartModel>newList=[];
    QuerySnapshot reviewCartValue=await FirebaseFirestore.instance.collection("Review").doc(FirebaseAuth.instance.currentUser!.uid).collection("review").get();
reviewCartValue.docs.forEach((element) {
ReviewCartModel reviewCartModel=ReviewCartModel(
  cartName: element.get("cartName"),
 cartImage: element.get("cartImage"), 
 cartId: element.get("cartId"), 
 cartPrice: element.get("cartPrice"),
 cartQuantity:element.get("cartQuantity"),
cartunit: element.get("cartunit")
 );
newList.add(reviewCartModel);
 });
review_cart_provider=newList;
notifyListeners();
  }


Future<void> updateCart(String ?cartId,String ?cartName,String ?cartImage,int cartPrice,int cartQuantity,) async{
//Cart
await FirebaseFirestore.instance.collection("Review").doc(FirebaseAuth.instance.currentUser!.uid).collection("review").doc(cartId).update({
"cartId":cartId,
"cartImage":cartImage,
"cartName":cartName,
"cartPrice":cartPrice,
"cartQuantity":cartQuantity,

});
getReviewCartData();
notifyListeners();
}



Future<void> addReviewData(String ?cartId,String ?cartName,String ?cartImage,int cartPrice,int cartQuantity,var cartunit
//bool isAdd
) async{

await FirebaseFirestore.instance.collection("Review").doc(FirebaseAuth.instance.currentUser!.uid).collection("review").doc(cartId).set({
"cartId":cartId,
"cartImage":cartImage,
"cartName":cartName,
"cartPrice":cartPrice,
"cartQuantity":cartQuantity,
"cartunit":cartunit
//"isAdd":isAdd
});

}
List<ReviewCartModel>get getReviewData{
return review_cart_provider;
}
deleteReview(cartId){
FirebaseFirestore.instance.collection("Review").doc(FirebaseAuth.instance.currentUser!.uid).collection("review").doc(cartId).delete();
notifyListeners();
}
  
}
/**
 * 
 * 

 productId
"RVpXCeX7dhhjbT45imfK"
product_Name
"Fruit"
product_Quantity
5
(number)
product_image
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjevPKVZprxTrD8OIPvKkJ9Fr_nOfEDKMaCQFf9pXc7w&s"
product_price
120
 */