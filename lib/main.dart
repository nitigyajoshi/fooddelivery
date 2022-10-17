import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/auth/signin.dart';
import 'package:fooddelivery/provider/check_out_provider.dart';
import 'package:fooddelivery/provider/product_provider.dart';
import 'package:fooddelivery/provider/review_cart_provider.dart';
import 'package:fooddelivery/provider/userProvider.dart';
import 'package:fooddelivery/screens/product_overview.dart';
import 'package:provider/provider.dart';

import 'provider/wishlist_provider.dart';
/**fooddata..
https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg
https://handletheheat.com/wp-content/uploads/2015/03/cake-doughnut-recipe-SQUARE-550x550.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjevPKVZprxTrD8OIPvKkJ9Fr_nOfEDKMaCQFf9pXc7w&s
........................
fooddata
https://upload.wikimedia.org/wikipedia/commons/a/a1/Momo_nepal.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjevPKVZprxTrD8OIPvKkJ9Fr_nOfEDKMaCQFf9pXc7w&s
https://handletheheat.com/wp-content/uploads/2015/03/cake-doughnut-recipe-SQUARE-550x550.jpg
https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg

freshfruit
https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg
https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg
https://thumbs.dreamstime.com/b/fruit-background-4270990.jpg
https://www.newbusinessage.com/img/news/20220511014752_1256.750@2x.jpg




 */
void main() async{

   WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   

    return MultiProvider(providers: [
ChangeNotifierProvider<ProductProvider>(create:(context)=>ProductProvider() ),
ChangeNotifierProvider(create: (context)=>UserProvider()),
ChangeNotifierProvider(create: (context)=>ReviewCartProvider()),
ChangeNotifierProvider(create: (context)=>Wishlist()),
ChangeNotifierProvider(create: (context)=>Check_out_provider()),




    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:
      //ProductOverview(productname: 'Fresh Basil', productimage: 'n')
       Signin(),
    ),);
  }
}

