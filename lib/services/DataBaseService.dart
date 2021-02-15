import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  final CollectionReference guestCollection = FirebaseFirestore.instance.collection('Guests');
  final CollectionReference creatorCollection = FirebaseFirestore.instance.collection('Creators');
  final CollectionReference requestCollection = FirebaseFirestore.instance.collection('Requests');

  //TODO: check if user exists in database
  static bool userExists(String username){
    return false;
  }

  Future updateData(String uid, String role) async{
    return await creatorCollection.doc(uid).set({
      'data' : 'value',
      'role' : role.toLowerCase()
    });
  }
  Future makeRequest(){

  }


}