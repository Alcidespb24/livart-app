import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/logInWidget.dart';
import 'package:flutter_app/widgets/signUpWidget.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreen createState() => _homeScreen();
}

class _homeScreen extends State<homeScreen> {
  bool isSignupScreen = true;

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
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'lib/app_icon.png',
                    width: 180,
                    alignment: AlignmentDirectional(0.0, 0.6),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 0,
                  margin: EdgeInsets.symmetric(horizontal: 0.4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional(0.0, -0.8),
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF000000),
                        Color(0xFF190A43),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: !isSignupScreen
                                        ? Color(0xFFFFFFFF)
                                        : Color(0xFFFFFFFF).withOpacity(0.5),
                                  ),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    height: 1,
                                    width: 85,
                                    color: Color(0xFFFFFFFF),
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSignupScreen
                                        ? Color(0xFFFFFFFF)
                                        : Color(0xFFFFFFFF).withOpacity(0.5),
                                  ),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    height: 1,
                                    width: 85,
                                    color: Color(0xFFFFFFFF),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (!isSignupScreen) logInWidget(),
                      if(isSignupScreen)signUpWidget(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}