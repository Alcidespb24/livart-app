import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final Widget? child;
  final Size? size;

  CircleImage({Key? key,this.child, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size!.width,
      height: size!.height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: child,
      ),
    );
  }
}
