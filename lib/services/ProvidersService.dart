import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});

final requestServiceProvider = Provider((ref)=>CreatorRequestService());
final creatorRequestProvider = StreamProvider.autoDispose<QuerySnapshot>((ref){
  return ref.watch(requestServiceProvider).creatorRequestList;
});
