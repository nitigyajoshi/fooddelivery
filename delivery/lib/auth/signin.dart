import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../provider/userProvider.dart';
import '../screens/home.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  UserProvider? userProvider;
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider!.addUser(user!.displayName, user.photoURL, user.email, user);
      //return user;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.6,
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
//  alignment: Alignment.center,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signin to continue',
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),
            Text(
              'Food Delivery App',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Container(
              child: SignInButton(Buttons.Google, text: 'signin with google',
                  onPressed: () {
                _googleSignUp().then((value) => Navigator.of(context)
                    .pushReplacement(
                        MaterialPageRoute(builder: (context) => Home())));
              }),
            ),
            Container(
              child: SignInButton(Buttons.Apple,
                  text: 'signin with apple', onPressed: () {}),
            ),
            Text(
              'By continuing you agree our',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text('Terms and condition',
                style: TextStyle(
                  fontSize: 15,
                ))
          ],
        )),
      ),
    );
  }
}
