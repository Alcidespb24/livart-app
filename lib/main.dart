import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/screens/authenticate/landingScreen.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/djRequests.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
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
            return StreamProvider<AppUser>.value(
              value: AuthService().user,
              child: MaterialApp(
                initialRoute: LandingScreen.id,
                routes: {
                  LandingScreen.id: (context) => LandingScreen(),
                  HomeScreen.id: (context) => HomeScreen(),
                  DjDashboard.id: (context) => DjDashboard(),
                  UserDashboard.id: (context) => UserDashboard(),
                  DjRequests.id: (context) => DjRequests(),
                },
              ),
            );
          }

          return SpinKitRotatingCircle(
            color: Colors.red,
            size: 50,
            duration: Duration(seconds: 5),
          );
        });
  }
}

