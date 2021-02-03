import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(PlayThis());
}

// App init
class PlayThis extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<User>.value(
              value: AuthService().user,
                child: MaterialApp(
                home: Wrapper(),
              ),
            );
          }

          return SpinKitRotatingCircle(
            color: Colors.white,
            size: 50,
            duration: Duration(seconds: 5),
          );
        });
  }
}
