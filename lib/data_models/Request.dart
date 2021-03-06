import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/SongStruct.dart';
import 'package:flutter_app/services/DataBaseRequestService.dart';

class Request {
  String fromUid;
  String toUid;
  int requestTimeMs;
  int timeRemainingMs;
  int triesLeft;
  bool fulfilled;
  SongStruct song;
  int paymentAmount;
  final DataBaseRequestService _dataBaseRequestService = DataBaseRequestService();

  Request({
    @required this.fromUid,
    @required this.toUid,
    @required this.song,
    @required this.requestTimeMs,
    this.fulfilled,
  });

  Map<String, dynamic> toMap() {
    return {
      "fromUid": this.fromUid,
      "toUid": this.toUid,
      "requestTimeMs": this.requestTimeMs,
      "fulfilled": this.fulfilled,
      "song": this.song.songToMap()
    };
  }

  void pushRequest(){
    _dataBaseRequestService.makeRequest(this);
  }
}
