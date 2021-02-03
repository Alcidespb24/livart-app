import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/Authentication.dart';
import 'package:flutter_app/screens/home/Home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null){
      print ("not signed in");
      return Authenticate();
    } else {
      print("signed in");
      return Home();
    }

    // Depending on current State (Signed In/Signed Out) determine if the Home
    // or authentication screen should be shown
    return Home();
  }
}
