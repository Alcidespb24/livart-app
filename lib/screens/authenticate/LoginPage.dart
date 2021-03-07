import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/widgets/EmailField.dart';
import 'package:flutter_app/widgets/PasswordField.dart';
import 'package:flutter_app/widgets/buttonWidget.dart';
import 'package:flutter_particles/particle.dart';
import 'package:flutter_particles/particles.dart';

import 'CreateAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  String emailField = '';
  String passwordField = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Particles(50, Color(0xFF00585F).withOpacity(0.3)),
          Container(
            color: Colors.black38,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: EmailField(onChangedEmail: (String email) {
                  emailField = email;
                }),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: PasswordField(
                  onChangedPassword: (String pwd) {
                    passwordField = pwd;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 180,
                margin: EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF009393),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPrimary: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.black,
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    String result = await _authService.signInEmailPwd(
                        emailField, passwordField);
                    if (result == null) {
                      print("Logged in successfully");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      'New to LivArt?',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: InkWell(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Color(0xFF00585F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        }),
                  ),
                ],
              )
            ],
          ),
          //  ),
        ],
      ),
    );
  }
}
