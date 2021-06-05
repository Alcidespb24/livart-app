import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';
import 'package:flutter_app/data_models/SongStruct.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_app/global_resources/Constants.dart';

class Request {
  final uuid = Uuid();

  String requestUuid;
  String fromUid;
  String toUid;
  SongModel song;
  int requestTimeMs;
  String timeRemainingMs;
  int triesLeft;
  int paymentAmount;
  bool fulfilled;

  Request({
    @required this.requestUuid,
    @required this.fromUid,
    @required this.toUid,
    @required this.song,
    @required this.requestTimeMs,
    @required this.timeRemainingMs,
    @required this.triesLeft,
    @required this.paymentAmount,
    this.fulfilled,
  }) {
    requestUuid = uuid.v4();
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "requestUuid": this.requestUuid,
      "fromUid": this.fromUid,
      "toUid": this.toUid,
      "song": this.song.toJson(),
      "requestTimeMs": this.requestTimeMs,
      "triesLeft": this.triesLeft,
      "paymentAmount": this.paymentAmount,
      "fulfilled": this.fulfilled,
    };
  }

  Request.fromMap(Map<String, dynamic> map) {
    requestUuid = map['requestUuid'];
    fromUid = map['fromUid'];
    toUid = map['toUid'];
    song = SongModel.fromJson(map['song']);
    requestTimeMs = map['requestTimeMs'];
    triesLeft = map['triesLeft'];
    paymentAmount = map['paymentAmount'];
    fulfilled = map['fulfilled'];
  }

  get remainingTime => timeRemainingMs;

  String get getTimeremainingMS => timeRemainingMs;
}
