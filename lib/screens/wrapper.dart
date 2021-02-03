import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/Authentication.dart';
import 'package:flutter_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Depending on current State (Signed In/Signed Out) determine if the Home
    // or authentication screen should be shown
    return Home();
  }
}
