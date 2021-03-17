import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/sideBar.dart';
import 'package:flutter_app/screens/dashboards/sideBarLayout.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/themes/theme.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: globalTheme.backgroundGradient,
          ),
        ],
      ),
    );
  }
}
