import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/TimerModel.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/firestore/UserRequestService.dart';
import 'package:flutter_app/services/notifiers/RequestListService.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:flutter_app/services/notifiers/TimerNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';

AuthService _authService = AuthService();


final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});


final requestServiceProvider = Provider.autoDispose((ref) {
 // ref.watch(authStateChangeProvider).whenData((data){
  //  if(_authService.getCurrentUser().userRole == Role.CREATOR){
  //    return CreatorRequestService();
  //  }
  //  return UserRequestService();
  //});

 if(_authService.getCurrentUser().userRole == Role.CREATOR){
    return CreatorRequestService();
  }
  return UserRequestService();
  return CreatorRequestService();
});
final requestProvider = StreamProvider.autoDispose<QuerySnapshot>((ref) {
  return ref.watch(requestServiceProvider).requestList;
});

final requestListFilter =
    StateProvider.autoDispose((_) => RequestListFilter.TIME_REMAINING);

final requestListProvider =
    StateNotifierProvider.autoDispose<RequestListService, List<Request>>((ref) {
      
  //Listen to the stream itself instead of the value held by the provider
  final firestoreListStream = ref.watch(requestProvider.stream);

 // final blah = ref.watch(requestServiceProvider);

  //Create the instance StateNotifier
  final requestListProvider = RequestListService([],cast<RequestServiceBase>(CreatorRequestService()));

  /// subscribe to the stream to change the state accordingly
  final subscription = firestoreListStream.listen((value) {
    if (value.docChanges.isEmpty) requestListProvider.clearList();

    for (int i = 0; i < value.docChanges.length; i++) {
      QueryDocumentSnapshot currentQuery = value.docs[i];
      //current item in list
      Request item = Request.fromMap(currentQuery.data());

      //add current item to the ListService
      requestListProvider.add(item);
    }
  });

  /// cancel subscription after provider is disposed to avoid memory leaks
  ref.onDispose(subscription.cancel);

  return requestListProvider;
});

final filteredRequestsProvider = Provider.autoDispose<List<Request>>((ref) {
  final filter = ref.watch(requestListFilter);
  final reqList = ref.watch(requestListProvider);

  switch (filter.state) {
    case RequestListFilter.AMOUNT_PAID:
      reqList.sort((a, b) {
        return a.paymentAmount.compareTo(b.paymentAmount);
      });
      return reqList;
    case RequestListFilter.ARTIST:
      reqList.sort((a, b) {
        return a.song.artistName.compareTo(b.song.artistName);
      });
      return reqList;
    case RequestListFilter.TIME_REMAINING:
    default:
      return reqList;
  }
});

