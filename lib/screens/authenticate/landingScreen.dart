import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/UserCreatorButton.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';
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
            decoration: GlobalTheme.backgroundGradient,
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
                        style: GlobalTheme.headText,
                      ),
                    ],
                  ),
                ),
                UserCreatorButton(
                    'Creator',
                    GlobalTheme.textButton1,
                    Role.CREATOR,
                    globalTheme.buttonDecoration1,
                    35.0,
                    GlobalTheme.buttonColor1), //Creator
                SizedBox(height: 5),
                UserCreatorButton(
                    'User',
                    GlobalTheme.textButton2,
                    Role.USER,
                    globalTheme.buttonDecoration2,
                    10.0,
                    GlobalTheme.buttonColor2),//User
              ],
            ),
          ),
        ],
      ),
    );
  }
}


