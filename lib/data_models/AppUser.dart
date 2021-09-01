import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';

enum Role { CREATOR, USER }

class AppUser implements DataModelBase<AppUser> {
  String? uid;
  String? userName;
  bool?/*?*/ isAnonymous;
  bool? emailVerified;
  Role?/*?*//*?*/ userRole;
  String? profilePicture;
  String? userLocation;

  AppUser(
      {/*required*/ /*required*/ /*required*/ /*required*/ required this.uid,
      required this.userName,
      /*required*/ /*required*/ required this.userRole,
      this.isAnonymous,
      this.emailVerified});

  AppUser.fromMap(Map<String, dynamic>? map) {
    int role = map?["userRole"];
    Role finalRole = Role.values[role];
    uid = map?["uid"];
    userName = map?["userName"];
    userRole = finalRole;
    userLocation = map?["userLocation"];
    emailVerified = map?["emailVerified"];
  }

  // Function Used to translate user data to a map
  // This map is used for database operations
  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> userDataMap = {
      "uid": this.uid,
      "userName": this.userName,
      "userRole": this.userRole!.index,
      "userLocation": this.userLocation,
      "emailVerified": this.emailVerified
    };
    return userDataMap;
  }

  @override
  AppUser fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }
}
