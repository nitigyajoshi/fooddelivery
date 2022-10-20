import 'package:flutter/material.dart';

import '../customwidgets/search_widget.dart';
import '../model/product_model.dart';

class Search extends StatefulWidget {
  // String title;
//String image;
//int ?price;
  Search({this.search});
  List<ProductModel>? search;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  List<ProductModel> searchItem(String query) {
    List<ProductModel> searchfood = widget.search!.where((element) {
      return element.product_Name.toLowerCase().contains(query);
    }).toList();
    return searchfood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
////////////////////////listtile/////////////////
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0XffC2C2),
                filled: true,
                hintText: 'Search for item in store',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((e) {
              return SearchItem(
                isbool: true,
                title: e.product_Name,
                image: e.product_image,
                price: e.product_price,
                id: e.productId,
                quantity: 1,
              );
            }).toList(),
          )
//
// ,SearchItem(isbool: true,title: 'Fruit',image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',price: 40,),
// SizedBox(height: 10,),

// Divider(height: 2,),
// SearchItem(isbool: true,title: 'Fruit',image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',price: 40),
// Divider(height: 2,)
// ,SizedBox(height: 10,),
// Divider(height: 2,),
// SearchItem(isbool: true,title: 'Fruit',image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',price: 40),
// SizedBox(height: 10,),
// Divider(height: 2,),
// SearchItem(isbool: true,title: 'Fruit',image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',price: 40),
        ],
      ),
    );
  }
}
