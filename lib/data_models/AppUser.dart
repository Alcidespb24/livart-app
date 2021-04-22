import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';

enum Role{
  CREATOR,
  USER
}

class AppUser implements DataModelBase<AppUser>{
  String uid;
  String userName;
  Role userRole;
  // Stores location identifier as provided by Maps API
  String userLocation;
  bool isAnonymous;
  bool emailVerified;



  AppUser({
    @required this.uid,
    @required this.userName,
    @required this.userRole,
    this.userLocation,
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
      "userRole": this.userRole.index,
      "userLocation": this.userLocation,
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
    userName: map["userName"],
    userRole: map["userRole"],
    userLocation: map["userLocation"],
    isAnonymous: map["isAnonymous"],
    emailVerified: map["emailVerified"]);

    return user;
  }
}