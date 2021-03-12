import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import'package:flutter_app/screens/authenticate/homeScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: AlignmentDirectional(0.0, -0.8),
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Color(0xFFE1E1EC),
            //       Color(0xFF1E5DA0),
            //     ],
            //   ),
            // ),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/app_icon.png',
                  width: 200,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'I AM A: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 38,
                  width: 250,
                  margin: EdgeInsets.only(left: 35, right: 35, top: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      elevation: 1,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                    },
                    child: Text(
                      "Creator",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 38,
                  width: 250,
                  margin: EdgeInsets.only(left: 35, right: 35, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color(0xFF00B5EE),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      elevation: 1,
                    ),
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                  },
                    child: Text(
                      "User",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
