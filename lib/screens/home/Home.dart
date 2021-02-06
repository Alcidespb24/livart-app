import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/SignIn.dart';
import 'package:flutter_app/services/AuthService.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          elevation: 60,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("Sign Out"),
              onPressed: () async {
                await _authService.signOut();
              },
            )
          ],
        ),
    );

  }
}
