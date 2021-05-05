import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF009393),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPrimary: Colors.white,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      child: Text(
        "Log in",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        //Navigator.push(context,
        //    MaterialPageRoute(builder: (context) => SignIn()));
      },
    );
  }
}
