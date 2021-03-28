import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/themes/theme.dart';

class UserCreatorButton extends StatefulWidget {
  UserCreatorButton(this.type, this.styleText, this.userRole, this.boxDecoration, this.marginTop, this.primaryColor);

  final String type;
  final TextStyle styleText;
  final BoxDecoration boxDecoration;
  final double marginTop;
  final Color primaryColor;
  final Role userRole;

  @override
  _UserCreatorButtonState createState() => _UserCreatorButtonState();
}

class _UserCreatorButtonState extends State<UserCreatorButton> {
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 250,
      margin: EdgeInsets.only(left: 35, right: 35, top: widget.marginTop),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:widget.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          elevation: 1,
        ),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(userRole: widget.userRole)));
        },
        child: Text(
          widget.type,
          style: widget.styleText,
        ),
      ),
    );
  }
}