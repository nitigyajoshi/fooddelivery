import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../customwidgets/search_widget.dart';
import '../../model/product_model.dart';
import '../../provider/wishlist_provider.dart';

class WishListScreen extends StatefulWidget {
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  Wishlist? wishlist;
  //WishListScreen Provider ?WishListScreen Provider;
  @override
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = MaterialButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = MaterialButton(
      child: Text("Yes"),
      onPressed: () {
        wishlist!.deleteWishList(delete.productId);
        // reviewCartProvider!.deleteReview(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(" Product"),
      content: Text("Are you delete  cartProduct?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    wishlist = Provider.of<Wishlist>(context);
    wishlist!.getWishList();
    print('length is');
    print('${wishlist!.geterWishList.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: Colors.yellow, fontSize: 18),
        ),
      ),
      body:
          //  child: Text(wishlist!.geterWishList.length.toString()),
          //  height: 100,

          ListView.builder(
        itemCount: wishlist!.geterWishList.length,
        //  (wishlist!.product_model.length),
        itemBuilder: (context, index) {
          ProductModel data = wishlist!.geterWishList[index];
          //product_model[index];
          return Column(children: [
            SizedBox(
              height: 10,
            ),

            SearchItem(
              id: data.productId,
              title: data.product_Name,
              image: data.product_image,
              price: data.product_price,
              quantity: data.quantity,
              isbool: true,
              delete: () {
                // showAlertDialog(context,data);
                showAlertDialog(
                  context,
                  data,
                );
              },
            ),

            // price: data.product_price, id: data.productId, quantity:data.quantity,
            // delete:(){
            //showAlertDialog(context,data);

            //  }
          ]);
        },
      ),
    );
  }
}
