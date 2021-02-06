import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/SignIn.dart';
import 'package:flutter_app/services/AuthService.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _authService = AuthService();
  AlertDialog _alertDialog = AlertDialog();

  String userEmail = '';
  String userPwd = '';
  bool validEmail = false;
  bool validPwd = false;
  bool validVerifed = false;

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
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value.isEmpty ||
                            value.contains('@') == false ||
                            value.contains('.') == false) {
                          return 'Please enter a valid email';
                        }
                        validEmail = true;
                        return null;
                      },
                      onChanged: (textValueEmail) {
                        setState(() {
                          userEmail = textValueEmail;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Enter Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        validPwd = true;
                        return null;
                      },
                      onChanged: (textValuePwd) {
                        setState(() {
                          userPwd = textValuePwd;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Verify Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        if (value != userPwd) {
                          return 'Password does not match';
                        }
                        validVerifed = true;
                        return null;
                      },
                      onChanged: (textValuePwd) {
                        setState(() {
                          userPwd = textValuePwd;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: ElevatedButton(
                          child: Text('Register Account'),
                          onPressed: () async {
                            if (validEmail && validPwd && validVerifed) {
                              dynamic accountCreated = await _authService
                                  .createAccountEmailPwd(userEmail, userPwd);
                              if (accountCreated == null) {
                                _showAlertDialog('Email Verification',
                                    'Your Account has been created\n '
                                    'An email has been sent to the email address provided \n'
                                    'Please Verify your email and sign in');
                              } else {
                                await _showAlertDialog(
                                    'Error Creating account', accountCreated);
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
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignIn()));
              },
            ),
          ],
        );
      },
    );
  }
}
