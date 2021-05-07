import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/Service.dart';

class FirestoreUserService extends Service {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  AuthService _authService;

  FirestoreUserService() {
    setState(NotifierState.INITIAL);
  }

  bool userExists(String userName) {
    setState(NotifierState.LOADING);
    bool userFound =
        (userCollection.where('userName', isEqualTo: userName)) == null
            ? false
            : true;
    setState(NotifierState.LOADED);
    return userFound;
  }

  // Should be called only when updating user data
  // TODO: determine if calling "update" on all user fields updates all fields or only those that changed
  Future updateUserData(AppUser user) async {
    setState(NotifierState.LOADING);
    try {
      await userCollection.doc(user.uid).update(user.toMap());
    } on FirebaseException {
      setFailure(Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB));
    }
    setState(NotifierState.LOADED);
  }

  // Should only be called when creating user
  // if a document exists with this user's uid the data will be overwritten
  Future createUserData(AppUser user) async {
    setState(NotifierState.LOADING);
    try {
      await userCollection.doc(user.uid).set(user.toMap());
    } on FirebaseException {
      setFailure(Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB));
    }
    setState(NotifierState.LOADED);
  }

  Future<AppUser> getUserFromUid(String uid) async {
    setState(NotifierState.LOADING);
    try {
      // Get Document for user
      DocumentSnapshot snapshot = await userCollection.doc(uid).get();
      AppUser currUserInfo = AppUser.fromMap(snapshot.data());
      assert(currUserInfo != null);

      setState(NotifierState.LOADED);
      return currUserInfo;
    } on FirebaseException {
      setFailure(Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB));
    } on AssertionError {
      setFailure(Failure(id: EventCodes.USER_NOT_FOUND_IN_DB));
    }
  }

  Future<AppUser> getUserFromUserName(String userName) async {
    try {
      setState(NotifierState.LOADING);
      // Get Document for user
      AppUser userInfo = await userCollection
          .where('userName', isEqualTo: userName)
          .get()
          .then((value) => AppUser.fromMap(value.docs[0].data()));
      assert(userInfo != null);

      setState(NotifierState.LOADED);

      return userInfo;
    } on FirebaseException {
      setFailure(Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB));
    } on AssertionError {
      setFailure(Failure(id: EventCodes.USER_NOT_FOUND_IN_DB));
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
    setState(NotifierState.LOADING);
    _authService = AuthService();
    String uid = _authService.getCurrentUser().uid;
    assert(uid != null);
    setState(NotifierState.LOADED);
    try {
      await userCollection.doc(uid).update({'userName': newUserName});
    } on FirebaseException {
      setFailure(Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB));
    } on AssertionError {
      setFailure(Failure(id: EventCodes.USER_NOT_FOUND_IN_DB));
    }
  }
}
