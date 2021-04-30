import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/homeScreen.dart';
import 'package:flutter_app/screens/authenticate/landingScreen.dart';
import 'package:flutter_app/screens/dashboards/djDashboard.dart';
import 'package:flutter_app/screens/dashboards/djRequests.dart';
import 'package:flutter_app/screens/dashboards/userDashboard.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_app/services/ProvidersService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: PlayThis()));
}
class PlayThis extends StatelessWidget {
  @override
  //_PlayThisState createState() => _PlayThisState();

  Widget build(BuildContext context) {
            return MaterialApp(
              home: Wrapper(),
            );


          return SpinKitRotatingCircle(
            color: Colors.red,
            size: 50,
            duration: Duration(seconds: 5),
          );

  }

}

/*class _PlayThisState extends HookState<PlayThis> {
  @override

}*/

class Wrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AuthService _authService = AuthService();

    final AppUser localUser = watch(authStateChangeProvider);


  /*  if (userAuthStream.hasData) {
      localAppuser = userAuthStream.data;

        if (localAppuser.userRole == Role.CREATOR) {
          print("user equals creator");
          return DjDashboard();
        }
        return UserDashboard();
      print("user equals null");
      return LandingScreen();
    }*/
  }
}
