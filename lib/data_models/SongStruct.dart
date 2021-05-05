// This class represents the structure of a song object
import 'package:flutter/foundation.dart';

class SongStruct {
  String songName;
  String artist;

  // I do not know if this is going to be used
  // added just in case
  String songUid;

  SongStruct({@required this.songName, @required this.artist, this.songUid});

  Map<String, dynamic> songToMap() {
    return {
      "songName": this.songName,
      "artist": this.artist,
      "songUid": this.songUid
    };
  }

  static SongStruct songFromMap(Map<String, dynamic> songMap) {
    SongStruct songStruct = new SongStruct(
        songName: songMap['songName'], artist: songMap['artist']);

    return songStruct;
  }
}
