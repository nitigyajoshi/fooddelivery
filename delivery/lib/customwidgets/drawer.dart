import 'package:flutter/material.dart';

import '../provider/userProvider.dart';
import '../review/review.dart';
import '../screens/home.dart';
import '../screens/myprofile.dart';
import '../screens/wishList/wishListScreen.dart';

// class DrawerSide extends StatefulWidget {
// //required final VoidCallback
//  // DrawerSide({ title, iconData,  onPressed});
//  // UserProvider userProvider;
//   //DrawerSide({this.userProvider});
//   @override
//   _DrawerSideState createState() => _DrawerSideState();
// }

// class _DrawerSideState extends State<DrawerSide> {
//   Widget listTile(
//     { String ?title, IconData ?iconData,final VoidCallback ?onTap}) {
//     return Container(

//       height: 50,
//       child: ListTile(
//         onTap: onTap,
//        // onTap: onTap,
//         leading: Icon(
//           iconData,
//           size: 28,
//         ),
//         title: Text(
//           title!,
//           style: TextStyle(color: Colors.black,

//         ),
//       ),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       child: Drawer(
//         child: Container(
//           color: Colors.yellow,
//           child: ListView(
//             children: [
//               DrawerHeader(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 43,
//                         backgroundColor: Colors.white54,
//                         // child: CircleAvatar(
//                         //   backgroundColor: Colors.yellow,
//                         //   backgroundImage: NetworkImage(
//                         //     userData.userImage ??
//                         //         "https://s3.envato.com/files/328957910/vegi_thumb.png",
//                         //   ),
//                         //   radius: 40,
//                         // ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                         //  Text(userData.userName),
//                           // Text(
//                           //   userData.userEmail,
//                           //   overflow: TextOverflow.ellipsis,
//                           // ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               Container(
//                 height: 350,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Contact Support"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text("Call us:"),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("+923352580282"),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Text("Mail us:"),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "assarbaloch5@gmail.com",
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////
///
///
//

class Draw extends StatefulWidget {
  UserProvider userProvider;

  Draw(
      {
      //String ?title,IconData ?iconData,Function ?onTap,
      required this.userProvider});

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  Widget drawer(
      {String? title, String? image, IconData? iconData, Function? onTap}) {
    return Container(
      height: 145,
      color: Color(0xffd1ad17),
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(children: [
              CircleAvatar(
                backgroundColor: Colors.white54,
                radius: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  backgroundImage: NetworkImage(image != null
                      ? image
                      : 'https://s3.envato.com/files/328957910/vegi_thumb.png'),
                  radius: 40,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(title != null ? title : 'Welcome'),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text("Welcome"),
              SizedBox(
                height: 7,
              ),
              Container(
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('login'),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget drawerbody(
      {String? title, IconData? iconData, final VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title!,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      leading: Icon(
        iconData,
        size: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return ListView(
      children: [
        drawer(title: userData.userName, image: userData.userImage),
        // CircleAvatar(

        // backgroundColor: Colors.white54,

        // radius: 45,

        // child: CircleAvatar(

        //   backgroundColor: Colors.yellow,
        // backgroundImage: NetworkImage('https://s3.envato.com/files/328957910/vegi_thumb.png'),

        //   radius: 40,

        // ),

        // ),
        drawerbody(
            title: 'Home',
            iconData: Icons.home_outlined,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            }),

        drawerbody(
          iconData: Icons.shop_outlined,
          title: "Review Cart",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ReviewCart()
                  //ProductOverview(productname: "hhhv",productimage: "",),
                  ),
            );
          },
        ),

        drawerbody(
          iconData: Icons.person_outlined,
          title: "My Profile",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Myprofile(
                  userProvider: widget.userProvider,
                ),
              ),
            );
          },
        ),

        drawerbody(
          iconData: Icons.notifications_outlined,
          title: "Notification",
        ),

        drawerbody(iconData: Icons.star_outline, title: "Rating & Review"),
        drawerbody(
            iconData: Icons.favorite_outline,
            title: "Wishlist",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WishListScreen(),
                ),
              );
            }),
        drawerbody(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
        drawerbody(iconData: Icons.format_quote_outlined, title: "FAQs")
      ],
    );

    //iconData: Icons.home_outlined,
    // title: "Home",
    // onTap: () {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) => Home(),
    //     ),
    //   );
    // },
  }
}
/**
 * listTile(
                  iconData: Icons.notifications_outlined, title: "Notificatio"),
              listTile(iconData: Icons.star_outline, title: "Rating & Review"),
              listTile(
                  iconData: Icons.favorite_outline,
                  title: "Wishlist",
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => WishLsit(),
                    //   ),
                   // );
                  }
                  ),
              listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
              listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
 * 
 * 
 * 
 */