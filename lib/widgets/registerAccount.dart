import 'package:flutter/material.dart';
import 'package:flutter_app/services/AuthService.dart';

AuthService authService = authService;

class registerAccount extends StatelessWidget {
  registerAccount(@required this.labeltext, @required this.icon);

  final String labeltext;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          labelText: labeltext,
          labelStyle: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23.0),
            borderSide: BorderSide(color: Color(0x3CADADAD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}