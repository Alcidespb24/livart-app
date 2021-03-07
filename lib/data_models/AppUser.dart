import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';

import 'Request.dart';

class AppUser implements DataModelBase<AppUser>{
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

  AppUser.fromMap(Map<String,dynamic> map){
    fromMap(map);
  }

  // Function Used to translate user data to a map
  // This map is used for database operations
  @override
  Map< String, dynamic > toMap(){
    Map <String,dynamic> userDataMap = {
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
  @override
  AppUser fromMap (Map<String,dynamic> map){
    AppUser user = new AppUser(
    uid: map["uid"],
    isCreator: map["isCreator"],
    userName: map["userName"],
    isAnonymous: map["isAnonymous"],
    emailVerified: map["emailVerified"]);

     return user;
  }
}