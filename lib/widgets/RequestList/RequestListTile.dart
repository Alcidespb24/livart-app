import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
