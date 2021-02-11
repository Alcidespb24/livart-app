import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/Authentication.dart';
import 'package:flutter_app/screens/home/Home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // If user is not Signed In, go to Authentication screen

    if (user == null){
      print ("not signed in");
      return Authenticate();
    }

    if (user.isAnonymous){
      print ("signed in anonymously");
      return Home();
    }

    if (user.emailVerified == true){
      print("signed in");
      return Home();
    }

    return Authenticate();
  }
}
