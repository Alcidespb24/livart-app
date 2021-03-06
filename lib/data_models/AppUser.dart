import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'Request.dart';

class AppUser {
  String uid;
  String userName;
  bool isAnonymous;
  bool emailVerified;
  bool isCreator;
  String profilePicture;

  AppUser({
    @required this.uid,
    @required this.userName,
    @required this.isCreator,
    this.isAnonymous,
    this.emailVerified
  });

  // Function Used to translate user data to a map
  // This map is used for database operations
  Map<String,dynamic> userToMap(){
    Map <String,dynamic> userDataMap;
    userDataMap = {
      "uid": this.uid,
      "userName": this.userName,
      "isCreator": this.isCreator,
      "isAnonymous": this.isAnonymous,
      "emailVerified": this.emailVerified
    };
    return userDataMap;
  }

  // Function used to translate a user Document Snapshot
  // to an AppUser object
  static AppUser userFromMap(Map<String,dynamic> userDocumentSnapshot){
    AppUser appUser = new AppUser(
    uid: userDocumentSnapshot["uid"],
    isCreator: userDocumentSnapshot["isCreator"],
    userName: userDocumentSnapshot["userName"],
    isAnonymous: userDocumentSnapshot["isAnonymous"],
    emailVerified: userDocumentSnapshot["emailVerified"]);

    return appUser;
  }
}