import 'package:delivery/provider/check_out_provider.dart';
import 'package:delivery/provider/customert_order_provider.dart';
import 'package:delivery/provider/product_provider.dart';
import 'package:delivery/provider/review_cart_provider.dart';
import 'package:delivery/provider/userProvider.dart';
import 'package:delivery/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:delivery/auth/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ReviewCartProvider()),
        ChangeNotifierProvider(create: (context) => Wishlist()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
        ChangeNotifierProvider(create: (context) => CustomerOrder()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            //ProductOverview(productname: 'Fresh Basil', productimage: 'n')
            Signin(),
      ),
    );
  }
}
