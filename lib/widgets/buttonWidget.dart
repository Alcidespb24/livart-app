import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;

  ButtonWidget(this.title, this.hasBorder);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Color(0xFF3C53E9) : Color(0xFFE94B3CFF),
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Color(0xFFE94B3C),
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 50.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
