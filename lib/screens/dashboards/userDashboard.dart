import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class UserDashboard extends StatefulWidget {
  static const String id = 'userDashboard_screen';

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            margin: _folded ? EdgeInsets.only(top: 200) : EdgeInsets.only(top: 130) ,
            child: Text(
              'Find a creator to play your favorite songs !',
              style: TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: _folded ? 56 : 200,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                boxShadow: kElevationToShadow[10],
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: !_folded
                            ? TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search'),
                        )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              child: InkWell(
                child: Container(
                  margin: _folded ? EdgeInsets.all(16.0) : EdgeInsets.only(left: 100),
                  child: Icon(
                    _folded ? EvaIcons.search : EvaIcons.close,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xFF262223),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.homeOutline,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.music,
              color: Colors.white,
            ),
            label: 'Requests Made',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.settings,
              color: Colors.white,
            ),
            label: 'Settings',
          ),
        ],
        // onTap: (){},
      ),
    );
  }
}
