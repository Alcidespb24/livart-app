import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/landingScreen.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/authenticate/DummyScreen.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authService = AuthService();
    AppUser localUser;

    return FutureBuilder(future: watch(authStateChangeProvider).when(
        data: (userData) async {
          if (userData != null) {
            localUser = await _authService.getFirestoreUser(userData);
          }

          if (localUser != null) {
            print(localUser.uid);

            return localUser.userRole == Role.CREATOR
                ? DjDashboard()
                : UserDashboard();
          }
          return LandingScreen();
        },
        loading: () async =>
            SpinKitRotatingCircle(
                color: Colors.red, size: 50, duration: Duration(seconds: 5)),
        error: (err, stack) async {
          return LandingScreen();
        }),
    builder: (context, AsyncSnapshot<Widget> snapshot){
      if(snapshot.hasData)
        return snapshot.data;

      return SpinKitRotatingCircle(
          color: Colors.red, size: 50, duration: Duration(seconds: 5));
    },
    );
  }
}
