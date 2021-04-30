import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authenticationSeriviceProvider =
Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<AppUser>((ref) {
  return ref
      .watch(authenticationSeriviceProvider)
      .user;
});