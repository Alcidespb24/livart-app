import 'package:flutter/material.dart';
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
        backgroundColor: Colors.cyan[25],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.3,
          title: Text('Sign in into PlayThis'),
        ),
        body: Container(
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
                      Row(
                        children: [
                          Padding(
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          child: ElevatedButton(
                              child: Text('Sign In with Email'),
                              onPressed: () async {
                                dynamic result = await _authService
                                    .signInEmailPwd(userEmail, userPassword);
                                if (result == null) {
                                  print("Error Signing In");
                                } else {
                                  print("Signed In");
                                  print(result);
                                }
                              }),
                        ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: ElevatedButton(
                                child: Text('Register Account'),
                                onPressed: () async {
                                  dynamic result = await _authService
                                      .createAccountEmailPwd(userEmail, userPassword);
                                  if (result == null) {
                                    print("Error Creating account");
                                  } else {
                                    print("Account created");
                                    print(result);
                                  }
                                }),
                          ),],
                      ),

                    ],
                  )),

              ElevatedButton(
                  child: Text('Sign In anonymously'),
                  onPressed: () async {
                    dynamic result = await _authService.signInAnonymous();
                    if (result == null) {
                      print("Error Signing In");
                    } else {
                      print("Signed In");
                      print(result);
                    }
                  }),
            ])));
  }

  void auth() async {}
}
