import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/RequestListService.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

AuthService _authService = AuthService();

final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});

final requestServiceProvider = Provider((ref) => CreatorRequestService());
final creatorRequestProvider = StreamProvider<QuerySnapshot>((ref) {
  return ref.watch(requestServiceProvider).creatorRequestList;
});

final requestListFilter =
    StateProvider((_) => RequestListFilter.TIME_REMAINING);


final requestListProvider = StateNotifierProvider.autoDispose<RequestListService, List<Request>>((ref) {
  //Listen to the stream itself instead of the value hold by the provider
  final firestoreListStream = ref.watch(creatorRequestProvider.stream);

  //Create the instance StateNotifier
  final requestListProvider = RequestListService([]);

  List<Request> curList = [];
  /// subscribe to the stream to change the state accordingly
  final subscription = firestoreListStream.listen((value) {
    if (value.docChanges.isEmpty)
      requestListProvider.clearList();

    for (int i = 0; i < value.docChanges.length; i++) {
      QueryDocumentSnapshot currentQuery = value.docs[i];
      //current item in list
      Request item = Request.fromMap(currentQuery.data());

      //add current item to the ListService
      curList.add(item);
    }
    requestListProvider.addAll(curList);
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
