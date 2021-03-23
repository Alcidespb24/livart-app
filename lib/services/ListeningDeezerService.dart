import 'package:dio/dio.dart';

import '../data_models/Listening_deezer_song_model.dart';

//This is to get the song info using the deezer API
class SongService {
  Dio _dio;

  SongService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: 'https://api.deezer.com/track/');
    _dio = Dio(options);
  }
  Future<DeezerSongModel> getTrack(id) async {
    try {
      final response = await _dio.get('$id',
          options: Options(headers: {
            'Content-type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8',
          }));
      DeezerSongModel result = DeezerSongModel.fromJson(response.data);
      //result will hold the song we get from deezer
      return result;
    } on DioError catch (e) {
      if (e.request != null) {
        throw 'An error has occured';
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }
}