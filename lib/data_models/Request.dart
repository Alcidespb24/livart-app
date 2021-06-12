
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Request {
  final uuid = Uuid();

  String requestUuid;
  String fromUid;
  String toUid;
  SongModel song;
  Timestamp requestTimeMs;
  String timeRemaining;
  int triesLeft;
  int paymentAmount;
  bool fulfilled;

  Request({
    @required this.requestUuid,
    @required this.fromUid,
    @required this.toUid,
    @required this.song,
    @required this.requestTimeMs,
    @required this.paymentAmount,
    this.fulfilled,
  }) {
    REQUEST_TIME_OUT_MIN.toString();
    timeRemaining = REQUEST_TIME_OUT_MIN.toString();
    triesLeft = 3;
    requestUuid = uuid.v4();
  }

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

  // returns false if request is still active
  // true if it needs to be removed;
  bool updateTimeRemaining(){
    bool needsRemoval = false;
    DateTime currentTime = DateTime.now();
    Duration elapsedTime = currentTime.difference(requestTimeMs.toDate());
    Duration timeLeft = REQUEST_TIME_OUT_MIN - elapsedTime;

    String formattedTimeLeft = DateFormat('mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(timeLeft.inMilliseconds));

    if (timeLeft <= Duration(minutes: 0)) {
       needsRemoval = true;
    } else {
      timeRemaining = formattedTimeLeft;
    }

    return needsRemoval;
  }
}
