import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/widgets/UserCreatorButton.dart';
import 'package:flutter_app/themes/theme.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: globalTheme.backgroundGradient,
            // color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                globalTheme.appLogo,
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'I AM A: ',
                        style: globalTheme.headText,
                      ),
                    ],
                  ),
                ),
                UserCreatorButton(
                    'Creator',
                    globalTheme.textButton1,
                    globalTheme.buttonDecoration1,
                    35.0,
                    globalTheme.buttonColor1), //Creator
                SizedBox(height: 5),
                UserCreatorButton(
                    'User',
                    globalTheme.textButton2,
                    globalTheme.buttonDecoration2,
                    10.0,
                    globalTheme.buttonColor2),//User
              ],
            ),
          ),
        ],
      ),
    );
  }
}
