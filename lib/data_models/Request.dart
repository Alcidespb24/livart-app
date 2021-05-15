import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';
import 'package:flutter_app/data_models/SongStruct.dart';
import 'package:flutter_app/data_models/songDataModel.dart';

class Request {
  String fromUid;
  String toUid;
  SongModel song;
  int requestTimeMs;
  int timeRemainingMs;
  int triesLeft;
  int paymentAmount;
  bool fulfilled;

  Request({
    @required this.fromUid,
    @required this.toUid,
    @required this.song,
    @required this.requestTimeMs,
    @required this.timeRemainingMs,
    @required this.triesLeft,
    @required this.paymentAmount,
    this.fulfilled,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "fromUid": this.fromUid,
      "toUid": this.toUid,
      "song": this.song.toJson(),
      "requestTimeMs": this.requestTimeMs,
      "timeRemaining": this.timeRemainingMs,
      "triesLeft": this.triesLeft,
      "paymentAmount": this.paymentAmount,
      "fulfilled": this.fulfilled,
    };
  }

  Request.fromMap(Map<String, dynamic> map) {
        fromUid = map['fromUid'];
        toUid = map['toUid'];
        song = SongModel.fromJson(map['song']);
        requestTimeMs = map['requestTimeMs'];
        timeRemainingMs = map['timeRemainingMs'];
        triesLeft = map['triesLeft'];
        paymentAmount = map['paymentAmount'];
        fulfilled = map['fulfilled'];
  }

  @override
 /* Request.fromMap(Map<String, dynamic> map) {
      Request(
        fromUid: map['fromUid'],
        toUid: map['toUid'],
        song: SongModel.fromJson(map['song']),
        requestTimeMs: map['requestTimeMs'],
        timeRemainingMs: map['timeRemainingMs'],
        triesLeft: map['triesLeft'],
        paymentAmount: map['paymentAmount'],
        fulfilled: map['fulfilled']);
  }*/

  int get getTimeremainingMS => timeRemainingMs;

  void updateTimeRemaining() {
    timeRemainingMs = requestTimeMs - DateTime.now().millisecondsSinceEpoch;
  }
}
