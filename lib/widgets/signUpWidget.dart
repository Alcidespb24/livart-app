import 'package:flutter/material.dart';

class signUpWidget extends StatelessWidget {
  const signUpWidget({
    Key key,
  }) : super(key: key);

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
            ),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.face_retouching_natural,
                color: Color(0xFFADADAD),
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
            ),
          ),
          SizedBox(height: 15),
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
                onSurface: Color(0xFFA400C1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                elevation: 1,
              ),
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