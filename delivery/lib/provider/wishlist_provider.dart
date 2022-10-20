import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';

class Wishlist with ChangeNotifier {
  List<ProductModel> product_model = [];
  void addWishList(
    String? wishListId,
    String? wishListName,
    String? wishListImage,
    int? wishListPrice,
    int wishListQuantity,
    //var punit
  ) async {
    await FirebaseFirestore.instance
        .collection("MyWishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("wishList")
        .doc(wishListId)
        .set({
      "cartId": wishListId,
      "cartImage": wishListImage,
      "cartName": wishListName,
      "cartPrice": wishListPrice,
      "cartQuantity": wishListQuantity,
      // "punit": 100,
      "wishListbool": true
    });
  }

  List<ProductModel> wishList = [];

  getWishList() async {
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("MyWishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("wishList")
        .get();

    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productId: element.get("cartId"),
        product_image: element.get("cartImage"),
        product_Name: element.get("cartName"),
        product_price: element.get("cartPrice"),
        quantity: element.get("cartQuantity"),
        // productunit: element.get("punit")
      );
      product_model.add(productModel);
      print(productModel);
    });
    wishList = product_model;
    notifyListeners();
  }

  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("MyWishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("wishList")
        .doc(wishListId)
        .delete();
    notifyListeners();
  }

  List<ProductModel> get geterWishList {
    return wishList;
  }
}
