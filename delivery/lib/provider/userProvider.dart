import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUser(String? user_Name, String? user_Image, String? user_Email,
      User currentUser) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser.uid)
        .set({
      "user_Name": user_Name,
      "user_Email": user_Email,
      "user_Image": user_Image,
      "userUid": currentUser.uid
    });
  }

  UserModel? currentData;
  void getUser() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
          userName: value.get("user_Name"),
          userEmail: value.get("user_Email"),
          userImage: value.get("user_Image"),
          userId: value.get("userUid"));
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData!;
  }
}
