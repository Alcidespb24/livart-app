import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String uid;
  String userName;
  bool isAnonymous;
  bool emailVerified;

  AppUser({
    this.uid,
    this.userName,
    this.isAnonymous,
    this.emailVerified
  });
}