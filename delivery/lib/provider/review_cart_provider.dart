import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  List<ReviewCartModel> review_cart_provider = [];
//get review data

  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("Review")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("review")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get("cartId"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"),
          cartunit: element.get("cartunit"));
      newList.add(reviewCartModel);
    });
    review_cart_provider = newList;
    notifyListeners();
  }

  Future<void> updateCart(
    String? cartId,
    String? cartName,
    String? cartImage,
    int cartPrice,
    int cartQuantity,
  ) async {
//Cart
    await FirebaseFirestore.instance
        .collection("Review")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("review")
        .doc(cartId)
        .update({
      "cartId": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
    });
    getReviewCartData();
    notifyListeners();
  }

  Future<void> addReviewData(String? cartId, String? cartName,
      String? cartImage, int cartPrice, int cartQuantity, var cartunit
//bool isAdd
      ) async {
    await FirebaseFirestore.instance
        .collection("Review")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("review")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "cartunit": cartunit
//"isAdd":isAdd
    });
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return review_cart_provider;
  }

  // List<ReviewCartModel> reviewCartDataList = [];

  deleteReview(cartId) {
    FirebaseFirestore.instance
        .collection("Review")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("review")
        .doc(cartId)
        .delete();
    notifyListeners();
  }

  totalPrice() {
    double total = 0.0;
    review_cart_provider.forEach((element) {
      total += element.cartPrice! * element.cartQuantity!.toInt();
    });

    return total;
  }
  //List<ReviewCartModel> reviewCartDataList = [];

  getTotalPrice() {
    double total = 0.0;
    review_cart_provider.forEach((element) {
      total += element.cartPrice! * element.cartQuantity!.toInt();
    });
    return total;
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