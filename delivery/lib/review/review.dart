import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import '../customwidgets/review_single.dart';
import '../model/review_cart_model.dart';
import '../provider/review_cart_provider.dart';
import '../screens/delivery_details/delivery_details.dart';

//  final String ?productId;
// final String ?productImage;
// final String ?productName;
//  final int ?productPrice;
//  final VoidCallback ?onTap;
//  int ?productQuantity;
//  var unit;
class ReviewCart extends StatefulWidget {
  final String? productId;
  // final String ?productImage;
  final String? productName;
  //  final int ?productPrice;
  //  final VoidCallback ?onTap;
  //  int ?productQuantity;
  final quantity;
  var unit;
  ReviewCart({this.quantity, this.productId, this.unit, this.productName});

  @override
  State<ReviewCart> createState() => _ReviewState();
}

class _ReviewState extends State<ReviewCart> {
  @override
  //Widget build(BuildContext context) {
  ReviewCartProvider? reviewCartProvider;

  VoidCallback? fun;

  int quantity = 0;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("Review")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("review")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      quantity = value.get("cartQuantity");
                      // isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
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
        reviewCartProvider!.deleteReview(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
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

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider!.getReviewCartData();

    return Scaffold(
        bottomNavigationBar: ListTile(
          title:
              // Column(children:[
              Text("Total Aount"),
          //  Text('\$ ${reviewCartProvider!.totalPrice()}')

          // ]),
          subtitle: Text(
            "\$ ${reviewCartProvider!.totalPrice()}",
            style: TextStyle(
              color: Colors.green[900],
            ),
          ),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              child: Text("Submit"),
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              onPressed: () {
//reviewCartProvider.addUser(cartId, cartName, cartImage, cartPrice, cartQuantity, isAdd)

                reviewCartProvider!.review_cart_provider.isEmpty
                    ? Fluttertoast.showToast(msg: "No Cart Data Found")
                    : Container(
                        height: 0,
                      );

                //print('object');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(),
                  ),
                );
              },
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Review Cart",
            style: TextStyle(color: Colors.yellow, fontSize: 18),
          ),
        ),
        body: reviewCartProvider!.review_cart_provider.isEmpty
            ? Text("NO DATA..")
            : ListView.builder(
                itemCount: reviewCartProvider!.review_cart_provider.length,
                itemBuilder: (context, index) {
                  ReviewCartModel data =
                      reviewCartProvider!.review_cart_provider[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ReviewSingle(
                        unit: data,
                        i: 1, productId: data.cartId,
                        productName: data.cartName,
                        productImage: data.cartImage,
                        productPrice: data.cartPrice!,
                        productQuantity:
                            //widget.unit,
                            //productQuantity: 1
                            data.cartQuantity!,
//                       )
                      )
                    ],
                  );
                })
// Consumer<ReviewCartProvider>(builder: (context,data,child){
//   //reviewCartProvider.review_cart...
// return
// data.review_cart_provider.isEmpty
//           ? Center(
//               child: Text("NO DATA"),
//             )
//           : ListView.builder(
//               itemCount: data.review_cart_provider.length,
//               itemBuilder: (context, index) {
//                 ReviewCartModel data1 =
//                     reviewCartProvider!.review_cart_provider[index];

//                    // quantity=data1.cartQuantity!;
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     // SearchItem(isbool: true, title: data1.cartName, image: data1.cartImage, price: data1.cartPrice,
//                     //  id: data1.cartId, quantity: data1.cartQuantity,delete:(){
//                     //   showAlertDialog(context,data1);

//                     // },),

//                       // },
//                     Row(children: [
// //Text(data1.cartunit),
//                       ReviewSingle(
//                         unit: data1,
//                       i: 1,productId: data1.cartId,
//                       productName: data1.cartName,productImage: data1.cartImage,
//                       productPrice:
//                       data1.cartPrice!,
//                       //productQuantity: widget.unit,
//                       productQuantity: data1.cartQuantity!,
//                       )

//  ],)
//                   ],
//                 );
//               },
//             );

// }),

        );
  }
  // }
}
