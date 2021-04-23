import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/screens/authenticate/landingScreen.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/djRequests.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: PlayThis()));
}

// App init
class PlayThis extends HookWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {}

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              home: Wrapper(),
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

class Wrapper extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthStream = useStream<AppUser>(AuthService().user);
    if(userAuthStream.hasError){
      print("has errror");
    }

    userAuthStream
    // No user currently signed in
    if (!userAuthStream.hasData) {
      print("user equals null");
      return LandingScreen();
    }

    // A user has already signed in
    else {
      if (userAuthStream.data.userRole == Role.CREATOR) {
        print("user equals creator");
        return DjDashboard();
      }

      return UserDashboard();
    }
  }
}
