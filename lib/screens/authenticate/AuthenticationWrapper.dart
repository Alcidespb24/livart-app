import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/landingScreen.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/dummyScreen.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/GlobalProviders.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(authStateChangeProvider).when(
        data: (userData) {
          print(userData);


          if (userData == null)
            return DummyScreen();

          if(userData.userRole == Role.CREATOR)
            return DummyScreen();

          return DummyScreen();
          //return UserDashboard();

        },
        loading: () =>
            SpinKitRotatingCircle(
                color: Colors.red, size: 50, duration: Duration(seconds: 5)),
        error: (err, stack) {return DummyScreen();});
  }
}