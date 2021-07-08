import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/data_models/songDataModel.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'notifiers/ACRCloudService.dart';

class RequestRecognitionService extends ChangeNotifier{
  final ACRCloudService _acrCloudService = ACRCloudService();

  Future<void> beginRecognitionProcess(Request request) async {
    Timer(REQUEST_RECOGNITION_INITIAL_SECS,() async {
      await startRecognition();
    });
  }






  Future<AppSongModel> startRecognition() async{
    await _acrCloudService.startRecognizing();

    if(_acrCloudService.success)
      return AppSongModel.fromDeezerSongModel(_acrCloudService.currentSong);

    return AppSongModel();
  }
}

final acrCloudChangeNotifier = ChangeNotifierProvider<RequestRecognitionService>((ref) {
  return RequestRecognitionService();
});