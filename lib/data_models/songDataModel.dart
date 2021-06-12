import 'package:flutter/cupertino.dart';

class SongModel {
  final int uid;
  final String type;
  final String link;
  final String title;
  final String album; //TODO: Could be a unique Id from Deezer
  final String previewUrl;
  final String artworkRawUrl;
  final String artistName;

  SongModel(
      {this.uid,
      this.type,
      this.link,
      @required this.title,
      this.previewUrl,
      this.artworkRawUrl,
      @required this.artistName,
      @required this.album});

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
        uid: json['uid'],
        type: json['type'],
        link: json['link'],
        title: json['title'],
        previewUrl: json['preview'],
        artworkRawUrl: json['album'],
        artistName: json['artist'],
        album: json['album']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> userDataMap = {
      'uid': this.uid,
      'type': this.type,
      'link': this.link,
      'title': this.title,
      'album': this.album,
      'previewUrk': this.previewUrl,
      'artWorkRawUrl' : this.artworkRawUrl,
      'artistName' : this.artistName
    };
    return userDataMap;
  }

  String artworkUrl(int size) {
    return this.artworkRawUrl.replaceAll('{w}x{h}', "${size}x$size");
  }
}
