import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/EventCodeDatabase.dart';
import 'package:flutter_app/data_models/Failure.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/Service.dart';

class FirestoreRequestService extends Service {
  final CollectionReference requestCollection = FirebaseFirestore.instance.collection('Requests');


  void makeRequest(Request request) {
    setState(NotifierState.LOADING);
    try {
      requestCollection.add(request.toMap());
    } on FirebaseException {
      setFailure(Failure(id: EventCodes.UNABLE_TO_WRITE_TO_DB));
    }

    setState(NotifierState.LOADED);
  }

  Future createCreatorRequestDoc(String creatorUid){
    Map<String,dynamic> map =  {creatorUid:''};
    requestCollection.add(map);
  }

  Future getRequests() {

  }

}