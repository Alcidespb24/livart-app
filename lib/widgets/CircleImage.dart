import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  Widget child;
  Size size;

  CircleImage({Key key, Widget this.child, Size this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: child,
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
