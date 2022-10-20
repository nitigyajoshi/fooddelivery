import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/delivery_address_model.dart';

class CustomerOrder with ChangeNotifier {
  Future<void> customerData(
      //String cartId,
      final DeliveryAddressModel? deliverAddressList,
      double amount
//bool isAdd
      ) async {
    await FirebaseFirestore.instance
        .collection("Customer")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("customer")
        .doc()
        .set({
      // "cartId": cartId,
      //"longitude":deliverAddressList. ,
      // "latitude": cartName,
      "city": deliverAddressList!.city,
      "street": deliverAddressList.street,
      "landmark": deliverAddressList.landMark,
      "phone": deliverAddressList.mobileNo,

//"isAdd":isAdd
    });
  }
}
