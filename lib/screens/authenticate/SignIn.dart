import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Wrapper.dart';
import 'package:flutter_app/screens/authenticate/CreateAccount.dart';
import 'package:flutter_app/services/AuthService.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String userEmail;
  String userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          title: Text('Sign in into PlayThis'),
          actions: <Widget>[
            TextButton.icon(
                label: Text('Register'),
                icon: Icon(Icons.account_box_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAccount()));
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              alignment: Alignment(0.0, 0.0),
              child: Column(children: <Widget>[
                Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            if (value.contains('@') == false ||
                                value.contains('.') == false) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (textValueEmail) {
                            setState(() => userEmail = textValueEmail);
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          onChanged: (textValuePwd) {
                            setState(() => userPassword = textValuePwd);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          child: ElevatedButton(
                              child: Text('Sign In with Email'),
                              onPressed: () async {
                                String result = await _authService
                                    .signInEmailPwd(userEmail, userPassword);

                                if (result == null) {
                                  print("Logged in successfully");
                                } else {
                                  _showAlertDialog(
                                      'Error Signing In', result);
                                  print(result);
                                }

                                if(!_authService.emailVerified()){
                                  _showAlertDialog('Error Signing In', 'Email has not been verified');
                                } else {
                                  return Wrapper();
                                }

                              }),
                        ),
                      ],
                    )),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: (){_authService.signInWithGoogle();},
                    label: Text('Sign in with Google'),
                    //icon: Icon(Icons.ac_unit_outlined),
                    icon: Image.asset('lib/assets/icons/google_icon.png',
                    height: 20,
                    width: 20,),
                ),
                ElevatedButton.icon(
                    label: Text('Sign In anonymously'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    icon: Image.asset('lib/assets/icons/incognito_icon.png',
                    height: 20,
                    width: 20,),
                    onPressed: () async {
                      dynamic result = await _authService.signInAnonymous();
                      if (result == null) {
                        print("Error Signing In");
                      } else {
                        print("Signed In");
                        print(result);
                      }
                    }),
              ])),
        ));
  }

  Future<void> _showAlertDialog(String titleText, String alertText) async {
    return showDialog<void>(
      context: context, // user must tap button!
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
              },
            ),
          ],
        );
      },
    );
  }
}
