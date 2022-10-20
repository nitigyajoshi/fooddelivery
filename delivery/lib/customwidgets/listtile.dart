import 'package:flutter/material.dart';
IconData ?icon;
String ?title;
Widget listTile(IconData icon,String title){
return ListTile(
leading: Icon(
icon,size:32
),
title: Text(title),

);
}