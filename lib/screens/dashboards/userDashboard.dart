import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';

class UserDashboard extends StatefulWidget {
  static const String id = 'userDashboard_screen';
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: GlobalTheme.backgroundGradient,
          ),
        ],
      ),
    );
  }
}
