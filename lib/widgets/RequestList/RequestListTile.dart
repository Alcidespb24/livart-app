
import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';

//TODO: Make the tile look better jesus im bad at making things look good

class RequestListTile extends StatefulWidget {
  String _songTitle;
  String _artistName;
  int _paymentAmount;
  String _timeLeft;

  RequestListTile(Request request) {
    _songTitle = request.song.title;
    _artistName = request.song.artistName;
    _paymentAmount = request.paymentAmount;
    _timeLeft = request.timeRemaining;
  }

  @override
  _RequestListTileState createState() => _RequestListTileState();
}

class _RequestListTileState extends State<RequestListTile> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.all(3),
      child: ListTile(
        leading: getTextWidget(widget._timeLeft),
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
