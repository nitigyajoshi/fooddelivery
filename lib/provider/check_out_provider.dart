import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Check_out_provider extends ChangeNotifier{
  bool isLoading=false;
TextEditingController firstName=TextEditingController();
TextEditingController lastName=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController district=TextEditingController();
TextEditingController city=TextEditingController();
TextEditingController street=TextEditingController();
TextEditingController additonalphone=TextEditingController();
TextEditingController landmark=TextEditingController();




void validator(context,myType){
if(firstName.text.isEmpty){
  Fluttertoast.showToast(msg: "no first name");
}else if(lastName.text.isEmpty){
  Fluttertoast.showToast(msg: "no last name");
}
else if(email.text.isEmpty){
  Fluttertoast.showToast(msg: "no email");
}
else if(phone.text.isEmpty){
  Fluttertoast.showToast(msg: "no phone number");
}else if(district.text.isEmpty){
  Fluttertoast.showToast(msg: "no district name");
}else if(city.text.isEmpty){
  Fluttertoast.showToast(msg: "no city name");
}else if(street.text.isEmpty){
  Fluttertoast.showToast(msg: "no street name");
}else if(additonalphone.text.isEmpty){
  Fluttertoast.showToast(msg: "no additional phone");
}else if(landmark.text.isEmpty){
  Fluttertoast.showToast(msg: "please add landmark");
}
else{isLoading=true;
notifyListeners();
FirebaseFirestore.instance.collection("AddDeliveryAddress").doc(FirebaseAuth.instance.currentUser!.uid).set({
"firstName":firstName.text,
"lastName":lastName.text,
"email":email.text,
"phone":phone.text,
"district":district.text,
"city":city.text,
"street":street.text  ,
"adresstype":myType.toString(),
"no additional phone":additonalphone.text,
"landmark":landmark.text


}).then((value)async{
  isLoading=false;
  notifyListeners();
await Fluttertoast.showToast(msg: "Add Delivery Address");
Navigator.of(context).pop();
notifyListeners();
});
notifyListeners();

}

}
getadress(){





}



}
