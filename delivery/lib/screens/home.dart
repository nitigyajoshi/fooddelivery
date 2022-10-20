import 'package:delivery/screens/product_overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../customwidgets/drawer.dart';
import '../customwidgets/single.dart';
import '../customwidgets/upperhomepage.dart';
import '../provider/product_provider.dart';
import '../provider/userProvider.dart';
import '../review/review.dart';
import '../search/search.dart';

var u = "50gram";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductProvider? productProvider;

  @override
  void initState() {
    ProductProvider provide = Provider.of(context, listen: false);

    provide.fetchProductData();
    provide.fetchfruitData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(
      context,
    );
    UserProvider userProvider = Provider.of(context);
    userProvider.getUser();
    return Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        drawer: Drawer(
          child: Draw(
            userProvider: userProvider,
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffd6b738),
          title: Text(
            'Home',
            style: TextStyle(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xFFFFD740),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Search(search: productProvider!.search)));
                    },
                    icon: Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Color.fromARGB(255, 114, 209, 36),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewCart()));
                    },
                    child: Icon(Icons.shop)),
              ),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      upperhome(),
                      // Padding(padding: EdgeInsets.only(left: 270),child: ElevatedButton(onPressed: (){}, child: Text('View All')),)
                      //, Padding(padding: EdgeInsets.only(left: 270,top: 400),child: ElevatedButton(onPressed: (){}, child: Text('View All')),)
                      SizedBox(
                        height: 30,
                      ),

                      Wrap(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 280),
                            child: Expanded(
                              child: IconButton(
                                iconSize: 10,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Search(
                                            search:
                                                productProvider!.getProductData,
                                          )));
                                },
                                icon: Wrap(
                                  children: [
                                    Icon(Icons.arrow_back_ios),
                                    Text(
                                      'All',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
//child: Text('View All')
                              ),
                            ),
                          ),
                        ],
                      ),

                      //);
                      /**
   * MaterialPageRoute(builder: (context)=>Search(
  search: productProvider!.getProductData,
))
);
   * 
   */

                      fresh(),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Fresh fruits',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 270),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Search(
                                        search: productProvider!.getfruitData,
                                      )));
                            },
                            child: Text('View All')),
                      ),
                      fresh2(),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [],
                        ),
                      )
                    ]),
              ],
            )));
  }

  Widget fresh() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productProvider!.getProductData.map((element) {
          return SingalProduct(
              productQuantity: 1,
              i: 0,
              //element.quantity!,
              productunit: element,
              productId: element.productId,
              productPrice: element.product_price!,
              productName: element.product_Name,
              productImage: element.product_image,
              onTap: () {
                print('product...........');
                print(element.productId);
                print(element.product_price);
                print(element.productId);
                print(element.product_Name);
                print(element.product_image);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductOverview(
                          punit: element.productunit,
                          productname: element.product_Name,
                          productimage: element.product_image,
                          productId: element.productId,
                          productprice: element.product_price,
                        )));
              });
        }).toList(),
      ),
    );
  }

  Widget fresh2() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(children: [
          Row(
            children: productProvider!.getfruitData.map((e) {
              return SingalProduct(
                  productunit: e,
                  i: 0,
                  productQuantity: e.quantity!,
                  productId: e.productId,
                  productImage: e.product_image,
                  productName: e.product_Name,
                  productPrice: e.product_price!,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductOverview(
                            punit: e.productunit,
                            productname: e.product_Name,
                            productimage: e.product_image,
                            productId: e.productId,
                            productprice: e.product_price)));
                  });
            }).toList(),
          ),
        ]));
  }
}
