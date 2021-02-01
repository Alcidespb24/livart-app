import 'package:flutter/material.dart';
import 'package:flutter_app/services/AuthService.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

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
        child: ElevatedButton(
            child: Text('Sign In anonymously '),
            onPressed: () async{
              dynamic result = await _authService.signInAnonymous();

              if (result == null){
                print("Error Signing In");
              }
              else{
                print("Signed In");
                print(result);
              }
            }
        ),
      ),
    );
  }

  void auth() async{
  }
}
