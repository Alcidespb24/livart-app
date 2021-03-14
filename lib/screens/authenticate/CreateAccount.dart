import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/SignIn.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';
import 'package:flutter_app/widgets/EmailField.dart';
import 'package:flutter_app/widgets/PasswordField.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _authService = AuthService();
  final FirestoreUserService _dataBaseUserService = FirestoreUserService();
  AlertDialog _alertDialog = AlertDialog();

  String userEmail = '';
  String userPwd = '';
  String userName= '';
  bool validEmail = false;
  bool validPwd = false;
  bool validVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          title: Text('Create PlayThis account'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              alignment: Alignment(0.0, 0.0),
              child: Column(children: <Widget>[
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(children: <Widget>[
                    EmailField(onChangedEmail: (String email){
                      userEmail = email;
                    }),
                    PasswordField(onChangedPassword: (String pwd){
                      userPwd = pwd;
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: ElevatedButton(
                          child: Text('Register Account'),
                          onPressed: () async {
                            if (validEmail && validPwd && validVerified) {
                              await _authService.createAccountEmailPwd(userEmail, userName, userPwd);
                              AppUser user = _authService.getCurrentUser();
                              if (user == null) {
                                _showAlertDialog('Email Verification',
                                    'Your Account has been created\n'
                                    'An email has been sent to the email address provided\n'
                                    'Please Verify your email and sign in');
                              } else {
                                await _showAlertDialog(
                                    'Error Creating account', 'user');
                              }
                            } else {
                              print('error please verify fields');
                            }
                          }),
                    ),
                  ]),
                ),
              ])),
        ));
  }

  Future _showAlertDialog(String titleText, String alertText) {
    return showDialog<void>(
      context: context, // user must tap button!
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(alertText),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                //Navigator.push(context,
                //    MaterialPageRoute(builder: (context) => SignIn()));
              },
            ),
          ],
        );
      },
    );
  }
}
