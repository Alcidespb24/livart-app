import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/sideBar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DjDashboard(),
          SideBar(),
        ],
      ),
    );
  }
}
