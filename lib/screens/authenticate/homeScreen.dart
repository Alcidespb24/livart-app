import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/logInWidget.dart';
import 'package:flutter_app/widgets/signUpWidget.dart';
import 'package:flutter_app/themes/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  bool isSignupScreen = true;
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: globalTheme.backgroundGradient,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'lib/assets/icons/app_icon.png',
                    width: 180,
                    alignment: AlignmentDirectional(0.0, 0.6),
                    color: globalTheme.miscellaneous,
                  ),
                ),
                Container(
                  height: 425,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 0,
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional(0.0, -2.05),
                      end: Alignment.bottomCenter,
                      colors: [
                        globalTheme.gradient1,
                        globalTheme.gradient2,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFFFFF).withOpacity(0.7),
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: !isSignupScreen
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFFFFFFFF).withOpacity(0.5),
                                    ),
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isSignupScreen
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFFFFFFFF).withOpacity(0.5),
                                    ),
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
                      if (!isSignupScreen) LogInWidget(),
                      if (isSignupScreen) SignUpWidget(),
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
