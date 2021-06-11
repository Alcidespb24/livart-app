import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/all.dart';

import '../AuthService.dart';

final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});