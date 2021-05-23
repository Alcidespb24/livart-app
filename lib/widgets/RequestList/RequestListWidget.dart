import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:flutter_app/widgets/RequestList/RequestListTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestListWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final updatedReqs = watch(requestListProvider);


    return Expanded(
      child: ListView.builder(
        itemCount: updatedReqs.length,
        itemBuilder: (context, int index) {
          return RequestListTile(updatedReqs[index]);
        },
      ),
    );
  }
}
