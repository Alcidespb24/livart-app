import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/widgets/UserCreatorButton.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional(0.0, -0.7),
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF000000),
                  Color(0xFF190A43),
                ],
              ),
            ),
            // color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/assets/icons/app_icon.png',
                  width: 200,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'I AM A: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
               UserCreatorButton('Creator', Colors.white, Colors.black, 35.0),
                SizedBox(height: 5),
                UserCreatorButton('User', Colors.black, Colors.white, 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
