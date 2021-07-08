import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:flutter_app/services/notifiers/ACRCloudService.dart';
import 'package:flutter_app/services/providers/RequestListProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: Make the tile look better jesus im bad at making things look good

class RequestListTile extends ConsumerWidget {
  final Request request;
  bool isTileEnabled = true;

  RequestListTile({this.request});

  @override
  Widget build(BuildContext context, watch) {
    final acrCloudProviderNotifier = watch(acrCloudChangeNotifier);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.all(3),
      child: ListTile(
        leading: getTextWidget(request.timeRemaining != null ? request.timeRemaining :  REQUEST_TIME_OUT_MIN.toString().substring(2, 7)),
        title: getTextWidget(request.song.title),
        subtitle: getTextWidget(request.song.artistName),
        trailing: getTextWidget(request.paymentAmount),
        tileColor: Colors.purple,
        dense: true,
        onTap: () async {
          acrCloudProviderNotifier.isRecognizing
          ? await acrCloudProviderNotifier.stopRecognizing()
          : await acrCloudProviderNotifier.startRecognizing();
        },
        enabled: isTileEnabled,
      ),
    );
  }
  void disableTile() {
    isTileEnabled = false;
  }

  Widget getTextWidget(dynamic value) {
    return Text(
      value.toString(),
      style: TextStyle(color: Colors.white),
    );
  }
}
