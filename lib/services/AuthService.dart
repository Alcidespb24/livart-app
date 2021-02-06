import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  // This is a private property
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential userCredential;

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
  // returns null on success or the error string if any errors occur
  Future<String> createAccountEmailPwd(String email, String pwd) async{
    try{
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pwd);

      if (!userCredential.user.emailVerified) {
        await userCredential.user.sendEmailVerification();
      }

      return null;
    } on FirebaseAuthException catch (error){
        if(error.code == 'weak-password'){
          return 'Password is too weak';
        } else if (error.code == 'email-already-in-use'){
          return 'This email is already in use, you dumbfuck';
        }
    } catch(error){
      return error.toString();
    }
    return null;
  }

  // Sign in email pwd
  Future<String> signInEmailPwd(String email,String pwd) async {
    try {

      if(!userCredential.user.emailVerified){
        return 'Email Not Verified, please check your email';
      }
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      return null;

    } on FirebaseAuthException catch(error){
      if (error.code == 'user-not-found'){
       return 'User not Found, Please verify your Email';
      } else if (error.code == 'wrong-password') {
       return 'Wrong password provided for that user';
      }
    } catch(error){
      return error.toString();
    }
    return null;
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