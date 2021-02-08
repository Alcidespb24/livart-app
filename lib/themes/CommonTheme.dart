import 'package:flutter/material.dart';

class ThemeControl {
  final double elevatedButtonRadius = 60.0;
  final double textButtonRadius = 10.0;

  ThemeData basicTheme() {
    return ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(elevatedButtonRadius),
                )),
            minimumSize: MaterialStateProperty.all<Size>(Size(20,35)))),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(textButtonRadius),
              ))),
        ));
  }
}
