import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/widgets/menuItems.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  final bool isSideBarOpened = true;
  String username = 'username';
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  AnimationController _animationController;
  final _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isSideBarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    color: globalTheme.sideBarColor,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100),
                        CircleAvatar(
                          backgroundColor: globalTheme.miscellaneous,
                          radius: 40,
                        ),
                        //will be used for the user to insert an image of himself/herself
                        Text(
                          username,
                        ),
                        Divider(
                          height: 25,
                          thickness: 0.1,
                          indent: 70,
                          endIndent: 70,
                          color: globalTheme.miscellaneous,
                        ),
                        SizedBox(height: 15),
                        MenuItems(Icons.list_rounded, 'Requests'),
                        SizedBox(height: 15),
                        MenuItems(Icons.qr_code, 'QR Code'),
                        SizedBox(height: 15),
                        MenuItems(Icons.location_on, 'Change Location'),
                        SizedBox(height: 15),
                        MenuItems(
                            Icons.settings_applications_outlined, 'Settings'),
                        Divider(
                          height: 25,
                          thickness: 0.1,
                          indent: 70,
                          endIndent: 70,
                          color: globalTheme.miscellaneous,
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuItems(Icons.logout, 'Log Out'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.8),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: Container(
                      width: 35,
                      height: 110,
                      color: globalTheme.sideBarColor,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _animationController.view,
                          color: globalTheme.miscellaneous1,
                          size: 30),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
