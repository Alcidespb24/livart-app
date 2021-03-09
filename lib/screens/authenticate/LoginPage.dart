import 'package:flutter/material.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/widgets/EmailField.dart';
import 'package:flutter_app/widgets/PasswordField.dart';

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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/backgrounds/background3.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xFF161D57).withOpacity(0.1),
                  Color(0xFF161D57).withOpacity(0.4),
                  Color(0xFF161D57).withOpacity(0.9),
                ],
                begin: Alignment.topCenter, //end: Alignment.bottomCenter,
              ),
            ),
          ),
          //    Center(
          // child:
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
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    await _authService.signInEmailPwd(
                        emailField, passwordField);

                    _authService.hasError();

                    _authService.failure.toString();

                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(),
                  ),
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
                      'New to PlayThist?',
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
                            color: Color(0xFF09817F),
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
