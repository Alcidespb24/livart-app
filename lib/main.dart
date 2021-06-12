import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/AuthenticationWrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // initialize Firebase and before that we need to initialize the widgets.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope(child: PlayThis()));
}

// App init
class PlayThis extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationWrapper(),
    );
  }
}
