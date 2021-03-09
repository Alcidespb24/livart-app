import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/services/DataBaseUserService.dart';
import 'package:flutter_app/services/Service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends Service {
  // This is a private property
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final DataBaseUserService _userDataBaseService = DataBaseUserService();
 // UserCredential _userCredential;
  static AppUser _currentUser;

  AuthService(){
    setState(NotifierState.INITIAL);
  }

  AppUser _appUserFromFirebaseUser(User user){
    return user != null ? new AppUser(
        uid: user.uid,
        isAnonymous: user.isAnonymous,
        isCreator: (user.isAnonymous) ? false : null,
        emailVerified: user.emailVerified,
        userName: user.displayName
    ) : null;
  }

  // Sign in anonymously
  void  signInAnonymous() async {
    try {
      setState(NotifierState.LOADING);
      // TODO: need to access firestore and delete user account if the user decides not to use his Email/Pwd anymore
      if(_auth.currentUser != null && _auth.currentUser.emailVerified == false){
        print('Deleting user'+_auth.currentUser.toString() );
      }

      UserCredential user = await _auth.signInAnonymously();
      _currentUser = _appUserFromFirebaseUser(user.user);

      super.setState(NotifierState.LOADED);
    } on  FirebaseAuthException{
      setFailure(Failure(id: 10020));
    }
  }

  // Authentication change for user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges().map((User user) => _appUserFromFirebaseUser(user));
  }

  // Create account with email and password
  void createAccountEmailPwd(String email, String userName, String pwd) async {
    try {
      setState(NotifierState.LOADING);
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pwd);

      _currentUser = _appUserFromFirebaseUser(userCredential.user);

      if (!userCredential.user.emailVerified) {
        await userCredential.user.sendEmailVerification();
      }

      setState(NotifierState.LOADED);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        setFailure(Failure(id: 10011));
      } else if (error.code == 'email-already-in-use') {
        setFailure(Failure(id: 10030));
      }
    }
  }

  // Sign in email pwd
  void signInEmailPwd(String email, String pwd) async {
    try {
      setState(NotifierState.LOADING);
      UserCredential curr = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      _currentUser = _appUserFromFirebaseUser(curr.user);
      setState(NotifierState.LOADED);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        setFailure(Failure(id: 10030));
      } else if (error.code == 'wrong-password') {
        setFailure(Failure(id: 10030));
      }
    } 
  }

  bool isEmailVerified() {
    return _currentUser.emailVerified;
  }

  // Sign in with google
  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential curr = await _auth.signInWithCredential(credential);
      _currentUser = _appUserFromFirebaseUser(curr.user);

    } on PlatformException {
      setFailure(Failure(id: 1040));
    }
  }

  void resetPwd(String email) async{
    try {
      setState(NotifierState.LOADING);
      await _auth.sendPasswordResetEmail(email: email);
      setState(NotifierState.LOADED);
    } on FirebaseAuthException{
      setFailure(Failure(id: 10000));
    }
  }

  AppUser getCurrentUser() {
    return  _currentUser;
  }

  // User Sign out
  void signOut() async {
    setState(NotifierState.LOADING);
    _googleSignIn.signOut();
    _auth.signOut();
    _currentUser = null;
    setState(NotifierState.LOADED);
  }
}
