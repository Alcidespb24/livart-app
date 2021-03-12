import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class LogInWidget extends StatelessWidget {
  const LogInWidget({
    Key key,
  }) : super(key: key);

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
            ),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_rounded,
                color: Color(0xFFADADAD),
                size: 13,
              ),
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Color(0xFFC4C4C4).withOpacity(0.1),
              labelText: 'EMAIL',
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
                  color: Color(0xFFADADAD),
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
            margin: EdgeInsets.only(left: 180, top: 5),
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
              color: Color(0xFFA400C1),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onSurface: Color(0xFF388E3C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                elevation: 1,
              ),
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
            margin: EdgeInsets.only(left: 40, right: 47),
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: AlignmentDirectional(0.0, -0.8),
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color(0xFFDC1919).withOpacity(0.8),
              //     Color(0xFFE3F509).withOpacity(0.8),
              //   ],
              // ),
              color: Colors.white,
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
                        style: TextStyle(color: Colors.black, fontSize: 12),
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