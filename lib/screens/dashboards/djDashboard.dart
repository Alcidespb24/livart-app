import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';

class DjDashboard extends StatefulWidget{
  @override
  _DjDashboardState createState() =>_DjDashboardState();
}

class _DjDashboardState extends State<DjDashboard> {

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