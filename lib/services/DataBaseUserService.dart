import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/Service.dart';



class DataBaseUserService extends Service{
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  AuthService _authService;



  bool userExists(String userName) {
    super.setState(NotifierState.LOADING);
    bool userFound =
        (userCollection.where('userName', isEqualTo: userName)) == null
            ? false
            : true;
    super.setState(NotifierState.LOADED);
    return userFound;
  }

  // Should be called only when updating user data
  // TODO: determine if calling "update" on all user fields updates all fields or only those that changed
  Future updateUserData(AppUser user) async {
    super.setState(NotifierState.LOADING);
    try {
      await userCollection.doc(user.uid).update(user.userToMap());
    } on FirebaseException {
      super.setFailure(Failure(id: 20000));
    }
    super.setState(NotifierState.LOADED);
  }

  // Should only be called when creating user
  // if a document exists with this user's uid the data will be overwritten
  Future createUserData(AppUser user) async {
    super.setState(NotifierState.LOADING);
    try {
      await userCollection.doc(user.uid).set(user.userToMap());
    } on FirebaseException {
      super.setFailure(Failure(id: 20000));
    }
    super.setState(NotifierState.LOADED);
  }

  Future<AppUser> getUserFromUid(String uid) async {
    super.setState(NotifierState.LOADING);
    try {
      // Get Document for user
      DocumentSnapshot snapshot = await userCollection.doc(uid).get();
      AppUser currUserInfo = AppUser.userFromMap(snapshot.data());
      assert(currUserInfo != null);

      super.setState(NotifierState.LOADED);
      return currUserInfo;
    } on FirebaseException {
       throw Failure(id: 20000);
    } on AssertionError {
      throw Failure(id: 20001);
    }
  }

  Future<AppUser> getUserFromUserName(String userName) async {
    try {
      // Get Document for user
      AppUser userInfo = await userCollection
          .where('userName', isEqualTo: userName)
          .get()
          .then((value) => AppUser.userFromMap(value.docs[0].data()));
      assert(userInfo != null);

      return userInfo;
    } on FirebaseException {
      super.setFailure(Failure(id: 20000));
    } on AssertionError {
      super.setFailure(Failure(id: 20001));
    }
  }

  Future<String> searchUsernameLive(String username) async {
    String returnstring = '';
    if (username.length > 0) {
      await userCollection
          .where('userName',
              isGreaterThanOrEqualTo: username,
              isLessThan: username.substring(0, username.length - 1) +
                  String.fromCharCode(
                      username.codeUnitAt(username.length - 1) + 1))
          .get()
          .then((data) {
        if (data.docs.isNotEmpty)
          returnstring = data.docs[0].data()['userName'];
      });

      return returnstring;
    }
    return '';
  }

  Future updateUserName(String newUserName) async {
    _authService = AuthService();
    String uid = _authService.getCurrentUser().uid;

    try {
      await userCollection.doc(uid).update({'userName': newUserName});
    } on FirebaseException {
      super.setFailure(Failure(id: 20000));
    } on AssertionError {
      super.setFailure(Failure(id: 20001));
    }
  }

}
