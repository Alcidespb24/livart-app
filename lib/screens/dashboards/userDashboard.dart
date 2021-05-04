import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:geolocator/geolocator.dart';

class UserDashboard extends StatefulWidget {
  static const String id = 'userDashboard_screen';
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

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
