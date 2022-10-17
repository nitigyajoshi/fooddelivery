import 'package:flutter/material.dart';
class Orderitem extends StatelessWidget {
  // Orderitem({Key? key}) : super(key: key);
bool ?istrue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
leading: Image.network(''),
title: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Food Name',style:TextStyle(color: Colors.grey),),
    Text('50gram',style:TextStyle(color: Colors.grey)),
    Text('50gram',)


  ],
  
),
subtitle: Text('5'),

    );
  }
}