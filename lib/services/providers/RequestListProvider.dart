
import 'package:dartz/dartz.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/firestore/RequestServiceBase.dart';
import 'package:flutter_app/services/notifiers/RequestListService.dart';
import 'package:hooks_riverpod/all.dart';
import 'RequestProvider.dart';

final requestListProvider =
StateNotifierProvider.autoDispose<RequestListService, List<Request>>((ref) {


  final currentRequestService = ref.watch(reqServiceProv);

  //Listen to the stream itself instead of the value held by the provider
  final firestoreListStream = ref.watch(reqStreamProvider.stream);

  //Create the instance StateNotifier
  final requestListProvider =
  RequestListService([], cast<RequestServiceBase>(currentRequestService));

  /// subscribe to the stream to change the state accordingly
  final subscription = firestoreListStream.listen((value) {
    if (value.docs.isEmpty) requestListProvider.clearList();

    List<Request> localReqList = [];

    for (int i = 0; i < value.docChanges.length; i++) {
      var currentQuery = value.docChanges[i].doc.data();
      //current item in list
      Request item = Request.fromMap(currentQuery);

      //add current item to the ListService
      localReqList.add(item);
    }
    requestListProvider.addAll(localReqList);
  });

  /// cancel subscription after provider is disposed to avoid memory leaks
  ref.onDispose(subscription.cancel);

  return requestListProvider;
});

final requestListFilter =
StateProvider.autoDispose((_) => RequestListFilter.TIME_REMAINING);

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