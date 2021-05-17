import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:flutter_app/services/RequestListService.dart';
import 'package:flutter_app/widgets/RequestList/RequestListTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestListWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final reqs = watch(filteredRequestsProvider);

    List requestUpdateWatcher = watch(filteredRequestsProvider);


    return Expanded(
      child: ListView.builder(
        itemCount: requestUpdateWatcher.length,
        itemBuilder: (context, int index) {
          return RequestListTile(requestUpdateWatcher[index]);
        },
      ),
    );
  }
}
