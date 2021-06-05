import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/services/ProvidersService.dart';
import 'package:flutter_app/widgets/RequestList/RequestListTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestListWidget extends StatefulWidget {
  @override
  _RequestListWidgetState createState() => _RequestListWidgetState();
}

class _RequestListWidgetState extends State<RequestListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final updatedReqs = watch(filteredRequestsProvider);
        return Expanded(
          child: ListView.builder(
            itemCount: updatedReqs.length,
            itemBuilder: (context, int index) {
              return RequestListTile(updatedReqs[index]);
            },
          ),
        );
      },
    );
  }
}
