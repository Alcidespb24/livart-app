

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/Service.dart';
import 'package:flutter_app/services/AuthService.dart';

class UserRequestService extends Service{
  static AuthService _authService = AuthService();

  static final CollectionReference requestCollection = FirebaseFirestore.instance.collection('Requests');

  Future makeRequest(Request request) {
    setState(NotifierState.LOADING);
    try {
      CollectionReference currentCreatorRequestCollection =
            FirebaseFirestore.instance.collection('Requests')
                .doc(request.toUid)
                .collection('creatorRequests');

      setState(NotifierState.LOADED);
      return currentCreatorRequestCollection.add(request.toMap());

    } on FirebaseException {
      throw Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB);
    }


  }
}