import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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

class _RequestListTileState extends State<RequestListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.only(top:12 ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              EvaIcons.musicOutline,
              color: Colors.purpleAccent,
              size: 27,
            ),
            SizedBox(
              width: 35,
            ),
            Column(
              children: <Widget>[
                getTextWidget(widget._songTitle),
                getTextWidget(widget._artistName)
              ],
            )
          ],
        ),
      ),
      title: getTextWidget(widget._timeLeft),
      trailing: getTextWidget(widget._paymentAmount),
      dense: true,
      onTap: () {},
    );
  }
  void disableTile() {
    isTileEnabled = false;
  }

  Widget getTextWidget(dynamic value) {
    return Text(
      value.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
