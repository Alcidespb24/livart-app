import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/widgets/menuItems.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  final AuthService _authService = AuthService();
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
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 39,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    color: GlobalTheme.sideBarColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 3),
                        CircleAvatar(
                          backgroundColor: GlobalTheme.miscellaneous,
                          radius: 40,
                        ),
                        SizedBox(height: 8,),
                        //will be used for the user to insert an image of himself/herself
                        Text(
                          username,
                          style: TextStyle(color: Colors.white),
                        ),
                        GlobalTheme.globalDivider,
                        SizedBox(height: 15),
                        MenuItems(icon: EvaIcons.musicOutline,title: 'Requests', onPressedItem: (){},),
                        SizedBox(height: 15),
                        MenuItems(icon: EvaIcons.code,title: 'QR Code', onPressedItem: (){}),
                        SizedBox(height: 15),
                        MenuItems(icon:EvaIcons.map,title: 'Change Location', onPressedItem: (){}),
                        SizedBox(height: 15),
                        MenuItems(
                            icon: EvaIcons.settings,title: 'Settings', onPressedItem: (){}),
                        Divider(
                          height: 25,
                          thickness: 0.1,
                          indent: 70,
                          endIndent: 70,
                          color: GlobalTheme.miscellaneous,
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            MenuItems(icon: Icons.logout,title: 'Log Out', onPressedItem: () async {
                              await _authService.signOut();
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.85),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: GlobalTheme.sideBarColor,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: _animationController.view,
                            color: GlobalTheme.miscellaneous,
                            size: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper <Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8,0 , height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
