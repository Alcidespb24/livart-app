import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/Service.dart';

abstract class RequestServiceBase extends Service {
  Future<void> deleteRequest(Request request);
  Stream<QuerySnapshot>? get requestList;
}

class RequestServiceInitial extends RequestServiceBase{
  @override
  Future<void> deleteRequest(Request request) async {
  }

  @override
  Stream<QuerySnapshot> get requestList => throw UnimplementedError();

}