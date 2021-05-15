import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:flutter_app/widgets/RequestList/RequestListTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    int counterVal = 1;
    List<Request> requestList = [];
    final watcher = watch(creatorRequestProvider);
    watcher.when(data: (value) {
      for (int i = 0; i < value.docs.length; i++) {
        QueryDocumentSnapshot currentQuery = value.docs[i];
        Request currentReq = Request.fromMap(currentQuery.data());
        requestList.add(currentReq);
      }
      counterVal = requestList.length;
    }, loading: () {
      counterVal = 0;
      requestList.length = 0;
      return Text('Loading');
    }, error: (err, stack) {
      counterVal = 0;
      requestList.length = 0;
      return Text('loading');
    });

    return Expanded(
      child: ListView.builder(
        itemCount: counterVal,
        itemBuilder: (context, int index) {
          return RequestListTile(requestList[index]);
        },
      ),
    );
  }
}
