import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/SignIn.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/DataBaseUserService.dart';
import 'package:flutter_app/widgets/registerAccount.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _authService = AuthService();
  final DataBaseUserService _dataBaseUserService = DataBaseUserService();
  AlertDialog _alertDialog = AlertDialog();

  String userEmail = '';
  String userPwd = '';
  String userName = '';
  bool validEmail = false;
  bool validPwd = false;
  bool validVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000000),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 50),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(children: <Widget>[
                        registerAccount(
                          'username',
                          Icon(
                            Icons.person,
                            color: Color(0xFFE7E7F3),
                            size: 17,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        registerAccount(
                          "Email",
                          Icon(
                            Icons.email_rounded,
                            color: Color(0xFFE7E7F3),
                            size: 17,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        registerAccount(
                          "Password",
                          Icon(
                            Icons.lock_rounded,
                            color: Color(0xFFE7E7F3),
                            size: 17,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        registerAccount(
                          "Re-enter Password",
                          Icon(
                            Icons.lock_open,
                            color: Color(0xFFE7E7F3),
                            size: 17,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          margin: EdgeInsets.only(left: 40, right: 40),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF28B5BB),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                onPrimary: Colors.white,
                                elevation: 1,
                                shadowColor: Colors.black,
                              ),
                              child: Text('Register Account'),
                              onPressed: () async {
                                if (validEmail && validPwd && validVerified) {
                                  dynamic accountCreated =
                                      await _authService.createAccountEmailPwd(
                                          userEmail, userName, userPwd);
                                  if (accountCreated == null) {
                                    _showAlertDialog(
                                        'Email Verification',
                                        'Your Account has been created\n'
                                            'An email has been sent to the email address provided\n'
                                            'Please Verify your email and sign in');
                                  } else {
                                    await _showAlertDialog(
                                        'Error Creating account',
                                        accountCreated);
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


// validator: (value) {
// if (value.isEmpty || _dataBaseUserService.userExists(userName)) {
// return 'Please enter a valid username';
// }
// validEmail = true;
// return null;
// },
// onChanged: (textValueUsername) {
// setState(() {
// userName = textValueUsername;
// });
// },