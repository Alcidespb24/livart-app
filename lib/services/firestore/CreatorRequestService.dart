import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';

class CreatorRequestService extends RequestServiceBase {
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

  @override
  Stream<QuerySnapshot> get requestList {
    return currentCreatorRequestCollection.snapshots();
  }

  @override
  Future<void> deleteRequest(Request request) async {
    try {
      await currentCreatorRequestCollection.doc(request.requestUuid).delete();
    } on FirebaseException {
      throw Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB);
    }
  }
}
