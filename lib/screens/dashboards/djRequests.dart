import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/themes/theme.dart';

class DjRequests extends StatefulWidget {
  @override
  _DjRequestsState createState() => _DjRequestsState();
}

class _DjRequestsState extends State<DjRequests> {
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
      )
    );
  }
}