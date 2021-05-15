import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/Request.dart';

//TODO: Make the tile look better jesus im bad at making things look good

class RequestListTile extends StatelessWidget {
  String _songTitle;
  String _artistName;
  int _paymentAmount;
  int _timeleft;

  RequestListTile(Request request) {
    _songTitle = request.song.title;
    _artistName = request.song.artistName;
    _paymentAmount = request.paymentAmount;
    _timeleft = request.timeRemainingMs;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.all(3),
      child: ListTile(
        leading: getTextWidget(_timeleft),
        title: getTextWidget(_songTitle),
        subtitle: getTextWidget(_artistName),
        trailing: getTextWidget(_paymentAmount),
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
