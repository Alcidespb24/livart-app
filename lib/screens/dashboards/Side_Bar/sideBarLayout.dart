import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/Dj/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/Side_Bar/sideBar.dart';

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
