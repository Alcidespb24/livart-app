import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});
