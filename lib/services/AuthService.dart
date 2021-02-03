import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  // This is a private property
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anonymously
  Future signInAnonymous() async {
    try {
      UserCredential authResult =  await _auth.signInAnonymously();
      return authResult;
    } catch(error) {
      print(error.toString());
      return null;
    }
  }

  // Authentication change for user stream
  // @return: null if not signed in, UserCredential Object if signed in
  Stream<User> get user {
    return _auth.authStateChanges();
  }

  // Create account with email and password
  Future createAccountEmailPwd(String email, String pwd) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pwd);


    } on FirebaseAuthException catch (error){
        if(error.code == 'weak-password'){
          print('Password is weak, Bitch');
          return null;
        } else if (error.code == 'email-already-in-use'){
          print('This email is already in use, you dumbfuck');
          return null;
        }
    } catch(error){
      print(error);
    }
  }

  // Sign in email pwd
  Future signInEmailPwd(String email,String pwd) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);

    } on FirebaseAuthException catch(error){
      if (error.code == 'user-not-found'){
        print('User Not Found');
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch(error){
      print(error);
    }
  }

  // Sign in google

  // Register email/password

  // register google

  // User Sign out
  Future signOut() async{
    try{
      return _auth.signOut();
    }catch (error){
      print(error.toString());
    }
  }
}