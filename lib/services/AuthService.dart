import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/services/Service.dart';
import 'package:flutter_app/services/firestore/FirestoreUserService.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends Service {
  // This is a private property
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirestoreUserService _userDataBaseService = FirestoreUserService();
  static AppUser? _currentUser;

  AuthService() {
    setState(NotifierState.INITIAL);
  }

  // Authentication change for user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<AppUser?> getFirestoreUser(User user) async {
    _currentUser = await _userDataBaseService.getUserFromUid(user.uid);
    return _currentUser;
  }

  // Create account with email and password
  Future createAccountEmailPwd(
      String email, String userName, String pwd, Role? userRole) async {
    try {
      setState(NotifierState.LOADING);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);

      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
      }

      _currentUser = AppUser(
        uid: userCredential.user!.uid,
        userName: userName,
        userRole: userRole,
      );
      setState(NotifierState.LOADED);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw Failure(id: EventCodes.PASSWORD_TOO_WEAK);
      } else if (error.code == 'email-already-in-use') {
        throw Failure(id: EventCodes.CREDENTIALS_IN_USE);
      }
    }
  }


  Future signInEmailPwd(String email, String pwd) async {
    try {
      setState(NotifierState.LOADING);
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      setState(NotifierState.LOADED);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw Failure(id: EventCodes.USER_NOT_FOUND_INVALID_UNAME);
      } else if (error.code == 'wrong-password') {
        throw (Failure(id: EventCodes.INVALID_CREDENTIALS));
      }
    }
  }

  bool? isEmailVerified() {
    _currentUser!.emailVerified = _auth.currentUser!.emailVerified;
    return _currentUser!.emailVerified;
  }


  Future<void> signInWithGoogle(Role? userRole) async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await (_googleSignIn.signIn() as FutureOr<GoogleSignInAccount>);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential curr = await _auth.signInWithCredential(credential);
    } on PlatformException {
      setFailure(Failure(id: EventCodes.SIGN_IN_FAILED));
    }
  }

  void resetPwd(String email) async {
    try {
      setState(NotifierState.LOADING);
      await _auth.sendPasswordResetEmail(email: email);
      setState(NotifierState.LOADED);
    } on FirebaseAuthException catch (e) {
      throw Failure(id: EventCodes.UNABLE_TO_SEND_PASSWORD_EMAIL);
    }
  }

  AppUser? getCurrentUser() {
    return _currentUser;
  }

  // User Sign out
  Future<void> signOut() async {
    setState(NotifierState.LOADING);
    _googleSignIn.signOut();
    _auth.signOut();
    _currentUser = null;
    setState(NotifierState.LOADED);
  }
}
