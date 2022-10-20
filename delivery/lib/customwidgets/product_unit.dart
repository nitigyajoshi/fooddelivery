import 'package:flutter/material.dart';

class ProductUnit extends StatefulWidget {
  String title;
  VoidCallback onTap;
  ProductUnit({required this.title, required this.onTap});

  @override
  State<ProductUnit> createState() => _ProductUnitState();
}

class _ProductUnitState extends State<ProductUnit> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Text(
            '${widget.title}',
            style: TextStyle(color: Colors.black, fontSize: 11),
          )
        ],
      ),
    );
  }
}
