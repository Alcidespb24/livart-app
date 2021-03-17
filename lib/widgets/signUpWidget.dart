import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboards/sideBarLayout.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key key,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50),
      child: Column(
        children: <Widget>[
          Text(
            'REGISTER NOW!',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFFFFFFFF),
              height: 3.4,
              fontFamily: 'RobotoCondensed-Bold.ttf',
            ),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                EvaIcons.person,
                color: globalTheme.iconsColor,
                size: 13,
              ),
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
              labelText: 'username',
              labelStyle: TextStyle(
                color: Color(0xFFADADAD),
                fontSize: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Color(0x3CADADAD),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                EvaIcons.email,
                color: globalTheme.iconsColor,
                size: 13,
              ),
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Color(0xFFADADAD),
                fontSize: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Color(0x3CADADAD),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                EvaIcons.lock,
                color: globalTheme.iconsColor,
                size: 13,
              ),
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
              labelText: '*********',
              labelStyle: TextStyle(
                color: Color(0xFFADADAD),
                fontSize: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Color(0x3CADADAD),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 38,
            width: 150,
            margin: EdgeInsets.only(left: 35, right: 35, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: globalTheme.buttonColor3,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: globalTheme.buttonColor3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                elevation: 1,
              ),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  SideBarLayout()));
              },
              child: Text(
                "Register Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
