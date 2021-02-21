import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/Request.dart';

class DataBaseRequestService {
  final CollectionReference requestCollection = FirebaseFirestore.instance.collection('Requests');


  Future makeRequest(Request request) {
    requestCollection.add(request.toMap());
  }

  Future getRequests() {

  }

}