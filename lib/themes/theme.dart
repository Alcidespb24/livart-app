import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalTheme extends StatelessWidget {
  final BoxDecoration buttonDecoration1 = BoxDecoration(
    borderRadius: BorderRadius.circular(14.0),
    color: Color(0xFF000000),
  ); //Creator Button Decoration
  final TextStyle textButton1 = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 13,
      fontFamily: 'SyneMono-Regular.ttf'); //Creator Text Button

  final BoxDecoration buttonDecoration2 = BoxDecoration(
    borderRadius: BorderRadius.circular(14.0),
    color: Color(0xFFFFFFFF),
  ); //User Button Decoration
  final TextStyle textButton2 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 13,
      fontFamily: 'SyneMono-Regular.ttf'); //User Text Button

  final TextStyle headText = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
      fontSize: 20,
      fontFamily:
          'SyneMono-Regular.ttf'); //Head Text style for landingScreen, homeScreen

  final BoxDecoration backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: AlignmentDirectional(0.0, -0.7),
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF000000),
        Color(0xFF1F1238),
      ],
    ),
  ); //BoxDecoration for the background used in every screen

  final Color miscellaneous = Color(0xFFFFFFFF);
  final Color miscellaneous1 = Color(0xFF000000);
  final Color buttonColor1 =
      Color(0xFF000000); //primaryColor for the creator button
  final Color buttonColor2 =
      Color(0xFFFFFFFF); //primaryColor for the user button
  final Color buttonColor3 = Color(0xFFA400C1); //color for the sign up button
  final Color buttonColor4 = Color(0xFF000000); //color for the submit button
  final Color gradient1 = Color(0xFF000000); //gradient color 1
  final Color gradient2 = Color(0xFF1F1238); //gradient color 2
  final Color textColor1 = Color(0xFFDBDBD); //TextField Color for homeScreen
  final font1 = TextStyle(fontFamily: 'RobotoCondensed-Bold.ttf');
  final font2 = TextStyle(fontFamily: 'SyneMono-Regular.ttf');
  final Color sideBarColor = Color(0xFF1F1238); //color for the sideBar
  final Color iconsColor = Color(0xFFFFFFFF); //color for all the icons
  final TextStyle menuText = TextStyle(
      color: Color(0xFF757585),
      fontSize: 13,
      fontFamily: 'SyneMono-Regular.ttf'); //style for the items inside the menu
  final Image appLogo =   Image.asset(
    'lib/assets/icons/app_icon.png',
    width: 200,
    alignment: AlignmentDirectional(0.0, 0.0),
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
