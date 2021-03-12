import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';

class UserCreatorButton extends StatelessWidget {
  UserCreatorButton(this.type, this.colorText, this.colorButton, this.marginTop);

  String type = '';
  Color colorText;
  Color colorButton;
  double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 250,
      margin: EdgeInsets.only(left: 35, right: 35, top: marginTop),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color:colorButton,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          elevation: 1,
        ),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          type,
          style: TextStyle(
            color: colorText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}