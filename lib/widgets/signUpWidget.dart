import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/FirestoreRequestService.dart';
import 'package:flutter_app/widgets/EmailField.dart';
import 'package:flutter_app/widgets/PasswordField.dart';
import 'package:flutter_app/screens/dashboards/sideBarLayout.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/themes/theme.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({this.userRole});
  final Role userRole;

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final AuthService _authService = AuthService();
  final FirestoreRequestService _requestService = FirestoreRequestService();
  GlobalTheme globalTheme = GlobalTheme();
  String emailField = '';
  String passwordField = '';
  String userNameField = '';
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
                Icons.face_retouching_natural,
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
          EmailField(onChangedEmail: (String email){
            setState(() {
              emailField = email;
            });
          }),
          SizedBox(height: 15),
          PasswordField(onChangedPassword: (String pwd){
            setState(() {
              emailField = pwd;
            });
          }),
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
              child: Text(
                "Register Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                _authService.createAccountEmailPwd(emailField, userNameField, passwordField, widget.userRole);

                if(!_authService.hasError()){
                  //TODO: Handle Error and display message to user
                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>  SideBarLayout()));
                  if(_authService.getCurrentUser().userRole == Role.CREATOR){
                    _requestService.createCreatorRequestDoc(_authService.getCurrentUser().uid);
                  }
                }

              },
            ),
          ),
        ],
      ),
    );
  }
}
