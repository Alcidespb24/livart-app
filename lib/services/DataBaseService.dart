import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/AppUser.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');
  final CollectionReference requestCollection = FirebaseFirestore.instance.collection('Requests');

  //TODO: check if user exists in database
  static bool userExists(String username){
    return false;
  }

  Future updateUserData(AppUser user) async{
    await userCollection.doc(uid).c

    return await creatorCollection.doc(uid).set({
      'data' : 'value',
      'role' : role.toLowerCase()
    });
  }
  Future makeRequest(){

  }


}