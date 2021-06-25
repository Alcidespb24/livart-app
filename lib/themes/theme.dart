import 'package:flutter/material.dart';

class GlobalTheme extends StatelessWidget {
  final BoxDecoration buttonDecoration1 = BoxDecoration(
    borderRadius: BorderRadius.circular(14.0),
    color: Color(0xFF000000),
  ); //Creator Button Decoration
  static const TextStyle textButton1 = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 13,
      fontFamily: 'RobotoCondensed-Bold.ttf'); //Creator Text Button

  final BoxDecoration buttonDecoration2 = BoxDecoration(
    borderRadius: BorderRadius.circular(14.0),
    color: Color(0xFFFFFFFF),
  ); //User Button Decoration
  static const TextStyle textButton2 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 13,
      fontFamily: 'RobotoCondensed-Bold.ttf'); //User Text Button

  static const TextStyle headText = TextStyle(
      fontSize: 24,
      color: Color(0xFFFFFFFF),
      height: 3.4,
      fontFamily:
          'RobotoCondensed-Bold.ttf'); //Head Text style for landingScreen, homeScreen

  static const BoxDecoration backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: AlignmentDirectional(0.0, -0.7),
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF000000),
        Color(0xFF1F1238),
      ],
    ),
  ); //BoxDecoration for the background used in every screen

  static const Color miscellaneous = Color(0xFFFFFFFF);
  static const Divider globalDivider = Divider(
    height: 25,
    thickness: 0.1,
    indent: 70,
    endIndent: 70,
    color: GlobalTheme.miscellaneous,
  );
  static const Color miscellaneous1 = Color(0xFF000000);
  var loginButton = ElevatedButton.styleFrom(
    primary:GlobalTheme.buttonColor4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    elevation: 1,
  );
  var signUpButton = ElevatedButton.styleFrom(
    primary: GlobalTheme.buttonColor3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    elevation: 1,
  );
  var offlineButton = ElevatedButton.styleFrom(
    primary: GlobalTheme.buttonColor2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    elevation: 1,
  );
  static const Color buttonColor1 =
      Color(0xFF000000); //primaryColor for the creator button
  static const Color buttonColor2 =
      Color(0xFFFFFFFF); //primaryColor for the user button
  static const Color buttonColor3 = Color(0xFFA400C1); //color for the sign up button
  static const Color buttonColor4 = Color(0xFF000000); //color for the submit button
  static const Color gradient1 = Color(0xFF000000); //gradient color 1
  static const Color gradient2 = Color(0xFF1F1238); //gradient color 2
  static const Color textColor1 = Color(0xFFDBDBD);
  static const requestsStyle = TextStyle(color: Colors.white, fontSize: 15, fontFamily:'RobotoCondensed-Bold.ttf');//TextField Color for homeScreen
  static const font1 = TextStyle(fontFamily: 'RobotoCondensed-Bold.ttf');
  static const font2 = TextStyle(fontFamily: 'RobotoCondensed-Bold.ttf');
  static const Color sideBarColor = Color(0xFF1F1238); //color for the sideBar
  static const Color iconsColor = Color(0xFFFFFFFF); //color for all the icons
  static const TextStyle menuText = TextStyle(
      color: Color(0xFF757585),
      fontSize: 13,
      fontFamily: 'RobotoCondensed-Bold'); //style for the items inside the menu
  final Image appLogo =   Image.asset(
    'lib/assets/icons/logo.png',
    width: 200,
    alignment: AlignmentDirectional(0.0, 0.0),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
