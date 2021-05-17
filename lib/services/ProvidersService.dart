import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_app/services/RequestListService.dart';
import 'package:flutter_app/services/firestore/CreatorRequestService.dart';
import 'package:flutter_app/widgets/RequestList/RequestListTile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});

final requestServiceProvider = Provider((ref)=>CreatorRequestService());
final creatorRequestProvider = StreamProvider<QuerySnapshot>((ref){
  return ref.watch(requestServiceProvider).creatorRequestList;
});

/*final requestListServiceProvider = Provider((ref)=>RequestListService());
final requestSnapshotListProvider = StreamProvider.autoDispose<List<Request>>((ref){
  return ref.watch(requestListServiceProvider).getRequestListStream();
});*/



final requestListProvider = StateNotifierProvider<RequestListService, List<Request>>((ref)=> RequestListService([]));
final requestListFilter = StateProvider((_)=> RequestListFilter.TIME_REMAINING);
final filteredRequestsProvider = Provider<List<Request>>((ref){
  final filter = ref.watch(requestListFilter);
  final reqList = ref.watch(requestListProvider).;
  final requestUpdateWatcher = ref.watch(creatorRequestProvider);

  requestUpdateWatcher.when(data: (value)
  {
    if (value.docs.isEmpty) {
      reqList.clear();
    }

    else {
      for (int i = 0; i < value.docChanges.length; i++) {
        QueryDocumentSnapshot currentQuery = value.docs[i];
        Request currentReq = Request.fromMap(currentQuery.data());
        reqList.add(currentReq);

      }
    }
  }, loading: () {
  }, error: (err, stack) {
  });



  /*switch (filter.state){
    case RequestListFilter.AMOUNT_PAID:
      reqList.sort((a,b){
        return a.paymentAmount.compareTo(b.paymentAmount);
      });
      return reqList;
    case RequestListFilter.ARTIST:
      reqList.sort((a,b){
        return a.song.artistName.compareTo(b.song.artistName);
      });
      return reqList;
    case RequestListFilter.TIME_REMAINING:
    default:
      return reqList;
  }*/
  return reqList;


});
//final requestListUpdate = Provider