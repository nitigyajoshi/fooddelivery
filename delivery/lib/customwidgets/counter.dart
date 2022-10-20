import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/review_cart_provider.dart';

class Counter extends StatefulWidget {
  String productName;
  String productimage;
  String productId;
  int productQuantity;
  int productPrice;
  List<dynamic> unit;
  Counter(
      {required this.unit,
      required this.productName,
      required this.productimage,
      required this.productId,
      required this.productQuantity,
      required this.productPrice});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);

    getAddQuantity() {
      FirebaseFirestore.instance
          .collection("ReviewCart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("reviewCart")
          .doc(widget.productId)
          .get()
          .then((value) => {
                if (this.mounted)
                  {
                    if (value.exists)
                      {
                        setState(() {
                          count = value.get("cartQuantity");
                          istrue = value.get("isAdd");
                        })
                      }
                  }
              });
    }

    return istrue == true
        ? Row(children: [
            Icon(
              Icons.arrow_drop_down,
              color: Colors.green,
              size: 15,
            ),
            // Text('50gm',style: TextStyle(color: Colors.green),),Icon(Icons.arrow_drop_down,color: Colors.green,size: 15,),

            InkWell(
                onTap: () {
                  if (count == 1) {
                    setState(() {
                      istrue = false;
                    });
                    reviewCartProvider.deleteReview(widget.productId);
                  } else if (count > 1) {
                    setState(() {
                      count--;
                    });
                    reviewCartProvider.updateCart(
                        widget.productId,
                        widget.productName,
                        widget.productimage,
                        widget.productPrice,
                        count);
                  }
// setState(() {
//   //istrue=false;
//   count--;
// });
                },
                child: Icon(
                  Icons.remove,
                  color: Colors.green,
                  size: 27,
                )),
            SizedBox(
              width: 7,
            ),
            Text('$count'),
            SizedBox(
              width: 7,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    //istrue=false;
                    count++;
                  });
                  reviewCartProvider.updateCart(
                    widget.productId,
                    widget.productName,
                    widget.productimage,
                    widget.productPrice,
                    count,
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 27,
                )),
            //  Icon(Icons.add,color: Colors.green)
          ])
        : Center(
            child: InkWell(
                highlightColor: Colors.red,
                focusColor: Colors.green,
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  setState(() {
                    istrue = true;
                  });
                  reviewCartProvider.addReviewData(
                      widget.productId,
                      widget.productName,
                      widget.productimage,
                      widget.productPrice,
                      count,
                      widget.unit);
//reviewCartProvider.updateCart(widget.productId, widget.productName, widget.productimage, widget.productPrice, count);
                },
                child: Container(
                  child: Text(
                    '+ Add',
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 3)]
                    // ,    border: Border(
                    //         left: BorderSide(
                    //             color: Colors.green,
                    //             width: 3,
                    //         ),
                    //       )
                    ,
                  ),
                )),
          );
  }
}
