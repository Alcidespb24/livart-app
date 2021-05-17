import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';

//TODO: Make the tile look better jesus im bad at making things look good

class RequestListTile extends StatefulWidget {
  String _songTitle;
  String _artistName;
  int _paymentAmount;
  int _timeLeft;
  int _requestTime;

  RequestListTile(Request request) {
    _songTitle = request.song.title;
    _artistName = request.song.artistName;
    _paymentAmount = request.paymentAmount;
    _timeLeft = request.timeRemainingMs;
    _requestTime = request.requestTimeMs;
  }

  @override
  _RequestListTileState createState() => _RequestListTileState();
}

class _RequestListTileState extends State<RequestListTile> {


  @override
  void initState() {
    // TODO: implement initStat

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.all(3),
      child: ListTile(
        leading: Text(
          widget._timeLeft.toString(),
          style: TextStyle(color: Colors.white),
        ),
        title: getTextWidget(widget._songTitle),
        subtitle: getTextWidget(widget._artistName),
        trailing: getTextWidget(widget._paymentAmount),
        tileColor: Colors.purple,
        dense: true,
      ),
    );
  }

  Widget getTextWidget(dynamic value) {
    return Text(
      value.toString(),
      style: TextStyle(color: Colors.white),
    );
  }
}
