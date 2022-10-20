import 'package:flutter/material.dart';

import '../provider/userProvider.dart';

class Myprofile extends StatefulWidget {
  UserProvider userProvider;
  Myprofile({required this.userProvider});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  Widget listtile({IconData? icon, String? title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title!),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;

    //double height = MediaQuery. of(context). size. height;
    return Scaffold(
        backgroundColor: Color(0xffd1ad17),
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 0,
          title: Text(
            'My profile',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData.userName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(userData.userEmail)
                                  ],
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  radius: 15,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child:
                                        Icon(Icons.edit, color: Colors.yellow),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      listtile(icon: Icons.shop_outlined, title: "My Orders"),
                      listtile(
                          icon: Icons.location_on_outlined,
                          title: "My Address"),
                      listtile(
                          icon: Icons.person_outline, title: "Refer a Friend"),
                      listtile(
                          icon: Icons.file_copy_outlined,
                          title: "Terms and condition"),
                      listtile(
                          icon: Icons.policy_outlined, title: "privacy policy"),
                      listtile(icon: Icons.add_chart, title: "About"),
                      listtile(
                          icon: Icons.exit_to_app_outlined, title: "logout"),
                    ],
                  ),
                  height: 632,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffcbcbcb),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.yellow,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userData.userImage == null
                      ? 'https://media.istockphoto.com/photos/patan-picture-id637696304?k=20&m=637696304&s=612x612&w=0&h=GqmMtggU2LgHWcXPFNxMrZg9dtPzyrnl9ek5oARcI7Y='
                      : userData.userImage),
                  radius: 45,
                ),
              ),
            )
          ],
        ));
  }
}
