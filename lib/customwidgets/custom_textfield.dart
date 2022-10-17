import 'package:flutter/material.dart';
class CostomField extends StatelessWidget {
final TextEditingController ?controller;
final String labelText;

final TextInputType ?keyboardType;
CostomField({this.controller, this.keyboardType,required this.labelText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:keyboardType ,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}