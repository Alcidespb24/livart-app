import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/sideBar.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          UserDashboard(),
          SideBar(),
        ],
      ),
    );
  }
}
