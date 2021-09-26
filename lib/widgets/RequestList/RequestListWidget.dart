import 'package:flutter/material.dart';
import 'package:flutter_app/services/providers/RequestListProvider.dart';
import 'package:flutter_app/widgets/RequestList/RequestListTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final localList = watch(requestListProvider!);
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: localList.length,
        itemBuilder: (context, int index) {
          return RequestListTile(localList[index]);
        },
      ),
    );
  }
}
