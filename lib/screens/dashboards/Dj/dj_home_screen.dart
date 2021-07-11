import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';

class DjHome extends StatefulWidget {
  @override
  _DjHomeState createState() => _DjHomeState();
}

class _DjHomeState extends State<DjHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalTheme().globalAppBar,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[],
      ),
    );
  }
}
