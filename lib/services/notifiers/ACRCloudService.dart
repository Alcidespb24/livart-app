import 'dart:async';

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/Listening_deezer_song_model.dart';
import 'package:flutter_app/data_models/Request.dart';
import 'package:flutter_app/global_resources/Constants.dart';
import 'package:flutter_app/services/ListeningDeezerService.dart';
import 'package:flutter_app/services/providers/RequestListProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ACRCloudService extends ChangeNotifier {
  ACRCloudService() {
    initAcr();
  }

  final AcrCloudSdk _acr = AcrCloudSdk();
  final _songService = SongService();
  Timer? requestRecognitionAttemptTimer;
  late DeezerSongModel currentSong;
  bool isRecognizing = false;
  bool success = false;

  //initializes AcrCloud
  Future<void> initAcr() async {
    try {
      _acr
        ..init(
          host: 'identify-eu-west-1.acrcloud.com', // https://www.acrcloud.com/
          accessKey: '6398948e9e5840fbde80acfa0caac7f8',
          accessSecret: 'GOcpTMNnN9B8pkd4rcjwmBMZquDYylvoGarJMWip',
          setLog: true,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {

    final metaData = song?.metadata;
    if (metaData != null && metaData.music!.length > 0) {
      print(song.metadata!.music![0].externalMetadata!.deezer!.track!.id);
      final trackId = metaData?.music![0]?.externalMetadata?.deezer?.track?.id;
      try {
        final res = await _songService.getTrack(trackId);
        currentSong = res;
       /* if (trackId.compareTo(requestToRecognize.song.uid) == 0 &&
            isRecognizing)
        {
          success = true;
        }*/
        notifyListeners();
      } catch (e) {
        isRecognizing = false;
        success = false;
        notifyListeners();
      }
    }
  }

  //This method when called will start recognizing the current song
  Future<void> startRecognizing() async {
    isRecognizing = true;
    success = false;
    notifyListeners();
    try {
      await _acr.start();
    } catch (e) {
      print(e.toString());
    }
  }

  //Method to stop recognizing
  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    if(requestRecognitionAttemptTimer!= null)
      requestRecognitionAttemptTimer!.cancel();
    notifyListeners();
    try {
      await _acr.stop();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> startSongRecognitionAttemptTimer() async {
    requestRecognitionAttemptTimer =
        Timer.periodic(REQUEST_RECOGNITION_INITIAL_SECS, (timer) async {
      //await startRecognizing(requestToRecognize);
    });
  }
}

final acrCloudChangeNotifier = ChangeNotifierProvider<ACRCloudService>((ref) {
  return ACRCloudService();
});
