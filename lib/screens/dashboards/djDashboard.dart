import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/dashboards/djRequests.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:geolocator/geolocator.dart';

class DjDashboard extends StatefulWidget {
  static const String id = 'djDashboard_screen';
  @override
  _DjDashboardState createState() => _DjDashboardState();
}

class _DjDashboardState extends State<DjDashboard> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Position lastLocation = await Geolocator.getLastKnownPosition();
    print(lastLocation);
    print(position);
  }

  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    var globalTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: GlobalTheme.backgroundGradient,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 35,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        EvaIcons.creditCardOutline,
                        size: 12,
                        color: Colors.white,
                      ),
                      hintText: 'Minimum price per request:',
                      hintStyle: TextStyle(fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
