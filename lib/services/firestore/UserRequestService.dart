

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/Service.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';

class UserRequestService extends RequestServiceBase{
  static AuthService _authService = AuthService();
  AppUser currentUser;

  static final CollectionReference requestCollection = FirebaseFirestore.instance.collection('Requests');
  CollectionReference currentUserRequestCollection;

  UserRequestService(){
    currentUser = _authService.getCurrentUser();


  }

  Future makeRequest(Request request) {
    setState(NotifierState.LOADING);
    try {
      CollectionReference currentCreatorRequestCollection =
            FirebaseFirestore.instance.collection('Requests')
                .doc(request.toUid)
                .collection('creatorRequests');

      setState(NotifierState.LOADED);
      return currentCreatorRequestCollection.doc(request.requestUuid).set(request.toMap());

    } on FirebaseException {
      throw Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB);
    }
  }



  Stream<QuerySnapshot> get requestList {
    return null;//currentCreatorRequestCollection.snapshots();
  }

  Future get usersRequests{

  }

  @override
  Future<void> deleteRequest(Request request) {
  }
}