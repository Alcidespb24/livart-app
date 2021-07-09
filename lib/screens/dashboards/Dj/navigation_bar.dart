import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/Dj/dj_home_screen.dart';
import 'package:flutter_app/screens/dashboards/Dj/qr_code.dart';
import 'package:flutter_app/screens/dashboards/Dj/settings.dart';
import 'package:flutter_app/screens/places_api/location_search.dart';

import 'djDashboard.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _navigationItem = [
    DjHome(),
    HomePlaces(),
    DjDashboard(),
    Code(),
    DjSettings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _navigationItem.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          backgroundColor: Color(0xff212121),
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 20,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.homeOutline,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.queue_music,
                color: Colors.white,
              ),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_outlined,
                color: Colors.white,
              ),
              label: 'QR',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.settingsOutline,
                color: Colors.white,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
