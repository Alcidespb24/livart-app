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
  UserCredential _userCredential;



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
  Future signInAnonymous() async {
    try {
      // TODO: need to access firestore and delete user account if the user decides not to use his Email/Pwd anymore
      if(_auth.currentUser != null && _auth.currentUser.emailVerified == false){
        print('Deleting user'+_auth.currentUser.toString() );
      }
      print (_auth.currentUser);
       UserCredential user = await _auth.signInAnonymously();

      await _userDataBaseService.createUserData(_appUserFromFirebaseUser(user.user));
    } on  FirebaseAuthException{
      super.setFailure(Failure(id: 10020));
      return null;
    }
  }

  // Authentication change for user stream
  // @return: null if not signed in, UserCredential Object if signed in
  Stream<AppUser> get user {
    return _auth.authStateChanges().map((User user) => _appUserFromFirebaseUser(user));
  }

  // Create account with email and password
  // returns null on success or the error string if any errors occur
  Future<String> createAccountEmailPwd(String email, String userName, String pwd) async {
    try {
      _userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pwd);

      if (!_userCredential.user.emailVerified) {
        await _userCredential.user.sendEmailVerification();
      }
      _userDataBaseService.updateUserName(userName);

      return null;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return 'Password is too weak';
      } else if (error.code == 'email-already-in-use') {
        return 'This email is already in use, you dumbfuck';
      }
    } catch (error) {
      return error.toString();
    }
    return null;
  }

  // Sign in email pwd
  Future<String> signInEmailPwd(String email, String pwd) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      //return null;

    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return 'User not Found, Please verify your Email';
      } else if (error.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      }
    } catch (error) {
      return error.toString();
    }
  }

  bool emailVerified() {
    return _auth.currentUser.emailVerified;
  }

  // Sign in google
  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on PlatformException catch(error){
      print (error);
    }
  }

  Future resetPwd(String email) async{
    await _auth.sendPasswordResetEmail(email: email);
  }

  AppUser getCurrentUser() {
    AppUser curr = _appUserFromFirebaseUser(_auth.currentUser);
    return (curr);
  }

  // User Sign out
  Future signOut() async {
    try {
      _googleSignIn.signOut();
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
