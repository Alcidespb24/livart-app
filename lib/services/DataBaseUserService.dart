import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/services/AuthService.dart';

class DataBaseUserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  AuthService _authService;

  bool userExists(String userName) {
    return (userCollection.where('userName', isEqualTo: userName)) == null
        ? false
        : true;
  }

  // Should be called only when updating user data
  // TODO: determine if calling "update" on all user fields updates all fields or only those that changed
  Future updateUserData(AppUser user) async {
    await userCollection.doc(user.uid).update(user.userToMap());
  }

  // Should only be called when creating user
  // if a document exists with this user's uid the data will be overwritten
  Future createUserData(AppUser user) async {
    await userCollection.doc(user.uid).set(user.userToMap());
  }

  Future<AppUser> getUserFromUid(String uid) async {
    // Get Document for user
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();
    AppUser currUserInfo = AppUser.userFromMap(snapshot.data());
    return currUserInfo;
  }

  Future<AppUser> getUserFromUserName(String userName) async {
    // Get Document for user
    return await userCollection.where('userName', isEqualTo: userName).get().then((value) => AppUser.userFromMap(value.docs[0].data()));
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

    await userCollection.doc(uid).update({'userName': newUserName});
  }
}
