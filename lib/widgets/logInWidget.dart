import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_app/screens/dashboards/sideBarLayout.dart';
import 'package:flutter_app/themes/theme.dart';

class LogInWidget extends StatefulWidget {

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50),
      child: Column(
        children: <Widget>[
          Text(
            'Welcome Back',
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
                Icons.email_rounded,
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
              Icons.vpn_key,
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
          )),
          Container(
            margin: EdgeInsets.only(left: 175, top: 5),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 9,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Container(
            height: 38,
            width: 150,
            margin: EdgeInsets.only(left: 35, right: 35, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: globalTheme.buttonColor4,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: globalTheme.buttonColor4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                elevation: 1,
              ),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
              },
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  height: 35,
                  thickness: 0.5,
                  indent: 0,
                  endIndent: 10,
                  color: Colors.white,
                ),
              ),
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Expanded(
                child: Divider(
                  height: 35,
                  thickness: 0.5,
                  indent: 10,
                  endIndent: 0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              color: globalTheme.miscellaneous,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    elevation: 1,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CommunityMaterialIcons.google,
                        size: 20,
                        color: Color(0xFFDC1919),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "SIGN IN WITH GOOGLE",
                        style: TextStyle(color: globalTheme.miscellaneous1, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
