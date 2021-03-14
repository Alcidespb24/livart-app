import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';
import 'package:flutter_app/data_models/SongStruct.dart';
import 'package:flutter_app/services/firestore/FirestoreRequestService.dart';

class Request extends DataModelBase {
  String fromUid;
  String toUid;
  SongStruct song;
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
      "song": this.song.songToMap(),
      "requestTimeMs": this.requestTimeMs,
      "timeRemaining": this.timeRemainingMs,
      "triesLeft": this.triesLeft,
      "paymentAmount": this.paymentAmount,
      "fulfilled": this.fulfilled,
    };
  }

  @override
  Request fromMap(Map<String, dynamic> map) {
    return Request(fromUid: map['fromUid'],
        toUid: map['toUid'],
        song: SongStruct.songFromMap(map['song']),
        requestTimeMs: map['requestTimeMs'],
        timeRemainingMs: map['timeRemainingMs'],
        triesLeft: map['triesLeft'],
        paymentAmount: map['paymentAmount'],
        fulfilled: map['fulfilled']
    );
  }
}
