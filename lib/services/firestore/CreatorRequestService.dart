import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/services/AuthService.dart';

class CreatorRequestService {
  final AuthService _authService = AuthService();
  static AppUser creator;
  CollectionReference currentCreatorRequestCollection;

  CreatorRequestService() {
    creator = _authService.getCurrentUser();
    currentCreatorRequestCollection = FirebaseFirestore
        .instance
        .collection('Requests')
        .doc(creator.uid)
        .collection('creatorRequests');
  }

  Stream<QuerySnapshot> get creatorRequestList {
    return currentCreatorRequestCollection.snapshots();
  }
}
