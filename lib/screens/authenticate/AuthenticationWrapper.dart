import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/landingScreen.dart';
import 'package:flutter_app/screens/dashboards/Dj/navigation_bar.dart';
import 'package:flutter_app/screens/dashboards/User/userDashboard.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/providers/AuthProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authService = AuthService();
    AppUser? localUser;

    return FutureBuilder<AppUser?>(
      future: watch(authStateChangeProvider!).when(
          data: (userData) async {
            if (userData != null) {
              localUser = await _authService.getFirestoreUser(userData);
            }

            return localUser;
          },
          loading: () => null,
          error: (err, stack) {
            return null;
          }),
      builder: (context, AsyncSnapshot<AppUser?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.userRole == Role.CREATOR) return NavigationBar();

          return UserDashboard();
        }

        return LandingScreen();
      },
    );
  }
}
