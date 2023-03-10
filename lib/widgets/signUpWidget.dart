import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';
import 'package:flutter_app/themes/theme.dart';
import 'package:flutter_app/widgets/FormFields/EmailField.dart';
import 'package:flutter_app/widgets/FormFields/PasswordField.dart';
import 'package:flutter_app/widgets/FormFields/UserField.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({this.userRole});

  final Role? userRole;



  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final AuthService _authService = AuthService();
  final FirestoreUserService _userService = FirestoreUserService();
  String emailField = '';
  String passwordField = '';
  String userNameField = '';
  GlobalTheme globalTheme = GlobalTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50),
      child: Column(
        children: <Widget>[
          Text(
            'Register Now!',
            style: TextStyle(fontSize: 24, height: 3, color: Colors.white),
          ),
          SizedBox(height: 15),
          UserField(onChangedUname: (String uName) {
            userNameField = uName;
          }),
          SizedBox(height: 15),
          EmailField(onChangedEmail: (String email) {
            emailField = email;
          }),
          SizedBox(height: 15),
          PasswordField(onChangedPassword: (String pwd) {
            passwordField = pwd;
          }),
          SizedBox(height: 15),
          Container(
            height: 38,
            width: 150,
            margin: EdgeInsets.only(left: 35, right: 35, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: GlobalTheme.buttonColor3,
            ),
            child: ElevatedButton(
              style: globalTheme.signUpButton,
              child: Text(
                "Register Now",
                style: TextStyle(
                  color: GlobalTheme.buttonColor2,
                  fontFamily: 'SyneMono-Regular.ttf',
                ),
              ),
              onPressed: () async {
                await _authService.createAccountEmailPwd(emailField, userNameField, passwordField, widget.userRole);

                if (!_authService.hasError()) {
                  //TODO: Handle Error and display message to user
                  await _userService
                      .createUserData(_authService.getCurrentUser());
                  Navigator.pushReplacementNamed(context, '/');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
