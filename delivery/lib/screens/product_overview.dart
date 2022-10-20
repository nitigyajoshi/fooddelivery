import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../customwidgets/bottomnav.dart';
import '../customwidgets/counter.dart';
import '../provider/review_cart_provider.dart';
import '../provider/wishlist_provider.dart';
import '../review/review.dart';

enum SigninCharacter { fill, outline }

List<dynamic> qun = ["50gram", "500gram", "1kg"];

class ProductOverview extends StatefulWidget {
  final String productname;
  final String productimage;
  final int? productprice;
  var punit;
  final String productId;
  ProductOverview(
      {required punit,
      required this.productname,
      required this.productimage,
      required this.productprice,
      required this.productId});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  ReviewCartProvider? reviewCartProvider;

  var price = 30;
  SigninCharacter _character = SigninCharacter.fill;
  bool wishListBoool = false;

  getbool() {
    FirebaseFirestore.instance
        .collection('MyWishList')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("wishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishListBoool = value.get("wishListbool");
                      })
                    }
                }
            });
  }

  @override
  void initState() {
    getbool();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Wishlist wishlist = Provider.of<Wishlist>(context);
    getbool();
    //print(widget.productimage);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Product Overview',
          style: TextStyle(),
        ),
      ),
      bottomNavigationBar: Row(children: [
        bottom(
            backgroundColor: Colors.white,
            iconcolor: Colors.grey,
            title: "Add to wishlist",
            icondata: wishListBoool == false
                ? Icons.favorite_outline
                : Icons.favorite,
            color: Colors.black,
            //Colors.black,
            onTap: () {
              setState(() {
                wishListBoool = !wishListBoool;
              });
              if (wishListBoool == true) {
                wishlist.addWishList(
                  widget.productId, widget.productname,
                  widget.productimage, widget.productprice, 2,
                  //  widget.punit
                );
              } else if (wishListBoool == false) {
                wishlist.deleteWishList(widget.productId);
              }
            }),
        bottom(
            backgroundColor: Colors.yellow,
            iconcolor: Colors.grey,
            title: "Go to cart",
            icondata: Icons.shop,
            color: Colors.black,
            onTap: () {
              // reviewCartProvider!.addReviewData(
              //     widget.productId,
              //     widget.productname,
              //     widget.productimage,
              //     widget.productprice!,
              //     1,
              //     widget.punit);

              //  setState(() async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewCart(
                            quantity: "50gram",
                            productId: widget.productId,
                            productName: widget.productname,
                          )));
              //    });
              //
            }),
      ]),
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 300,
            child: Expanded(
                flex: 2,
                child: Container(
                  //  color: Colors.amber,
                  // height: 250,
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          widget.productname,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('\$40'),
                      ),
                      Container(
                        height: 200,
                        child: Image.network(widget.productimage),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              'Available option',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.green[700],
                    ),
                    Radio(
                        value: SigninCharacter.fill,
                        groupValue: _character,
                        activeColor: Colors.green[700],
                        onChanged: (value) {
                          setState(() {
                            //_character=value
                          });
                        }),
                    Text('\$50'),
                    SizedBox(
                      width: 20,
                    ),
                    //counter commented

                    Counter(
                        unit: qun,
                        productName: widget.productname,
                        productimage: widget.productimage,
                        productId: widget.productId,
                        productQuantity: 2,
                        productPrice: widget.productprice!)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Product Overview',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Fruit crops represent a wide range of woody perennial species cultivated in orchards where soils vary greatly in their biological, chemical, and physical ...',
            style: TextStyle(),
          )
        ]),
      ),
    );
  }
}
