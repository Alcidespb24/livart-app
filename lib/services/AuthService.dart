import 'package:firebase_auth/firebase_auth.dart';

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

  // Sign in email pwd
  Future signInEmail() async {
    try {
      //await _auth.signInWithEmailAndPassword(email: email, password: password)
    } catch(error){
      print(error.toString());
    }
  }

  // Sign in google

  // Register email/password

  // register google
}