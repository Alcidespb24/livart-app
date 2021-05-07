// To parse this JSON data, do
//
//     final deezerSongModel = deezerSongModelFromJson(jsonString);

import 'dart:convert';

DeezerSongModel deezerSongModelFromJson(String str) =>
    DeezerSongModel.fromJson(json.decode(str));

String deezerSongModelToJson(DeezerSongModel data) =>
    json.encode(data.toJson());

class DeezerSongModel {
  DeezerSongModel({
    this.id,
    this.readable,
    this.title,
    this.titleShort,
    this.titleVersion,
    this.isrc,
    this.link,
    this.share,
    this.bpm,
    this.md5Image,
    this.artist,
    this.album,
    this.type,
  });

  int id;
  bool readable;
  String title;
  String titleShort;
  String titleVersion;
  String isrc;
  String link;
  dynamic share;
  dynamic duration;
  dynamic bpm;
  String md5Image;
  Artist artist;
  Album album;
  String type;

  DeezerSongModel copyWith({
    int id,
    bool readable,
    String title,
    String titleShort,
    String titleVersion,
    String isrc,
    String link,
    dynamic share,
    dynamic bpm,
    String md5Image,
    Artist artist,
    Album album,
    String type,
  }) =>
      DeezerSongModel(
        id: id ?? this.id,
        readable: readable ?? this.readable,
        title: title ?? this.title,
        titleShort: titleShort ?? this.titleShort,
        titleVersion: titleVersion ?? this.titleVersion,
        isrc: isrc ?? this.isrc,
        link: link ?? this.link,
        share: share ?? this.share,
        bpm: bpm ?? this.bpm,
        md5Image: md5Image ?? this.md5Image,
        artist: artist ?? this.artist,
        album: album ?? this.album,
        type: type ?? this.type,
      );

  factory DeezerSongModel.fromJson(Map<String, dynamic> json) =>
      DeezerSongModel(
        id: json["id"] == null ? null : json["id"],
        readable: json["readable"] == null ? null : json["readable"],
        title: json["title"] == null ? null : json["title"],
        titleShort: json["title_short"] == null ? null : json["title_short"],
        titleVersion:
            json["title_version"] == null ? null : json["title_version"],
        isrc: json["isrc"] == null ? null : json["isrc"],
        link: json["link"] == null ? null : json["link"],
        share: json["share"] == null ? null : json["share"],
        bpm: json["bpm"] == null ? null : json["bpm"],
        md5Image: json["md5_image"] == null ? null : json["md5_image"],
        artist: json["artist"] == null ? null : Artist.fromJson(json["artist"]),
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "readable": readable == null ? null : readable,
        "title": title == null ? null : title,
        "title_short": titleShort == null ? null : titleShort,
        "title_version": titleVersion == null ? null : titleVersion,
        "isrc": isrc == null ? null : isrc,
        "link": link == null ? null : link,
        "share": share == null ? null : share,
        "duration": duration == null ? null : duration,
        "bpm": bpm == null ? null : bpm,
        "md5_image": md5Image == null ? null : md5Image,
        "artist": artist == null ? null : artist.toJson(),
        "album": album == null ? null : album.toJson(),
        "type": type == null ? null : type,
      };
}

class Album {
  Album({
    this.id,
    this.title,
    this.link,
    this.cover,
    this.coverSmall,
    this.coverMedium,
    this.coverBig,
    this.coverXl,
    this.md5Image,
    this.releaseDate,
    this.tracklist,
    this.type,
  });

  dynamic id;
  String title;
  String link;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  String md5Image;
  DateTime releaseDate;
  String tracklist;
  String type;

  Album copyWith({
    dynamic id,
    String title,
    String link,
    String cover,
    String coverSmall,
    String coverMedium,
    String coverBig,
    String coverXl,
    String md5Image,
    DateTime releaseDate,
    String tracklist,
    String type,
  }) =>
      Album(
        id: id ?? this.id,
        title: title ?? this.title,
        link: link ?? this.link,
        cover: cover ?? this.cover,
        coverSmall: coverSmall ?? this.coverSmall,
        coverMedium: coverMedium ?? this.coverMedium,
        coverBig: coverBig ?? this.coverBig,
        coverXl: coverXl ?? this.coverXl,
        md5Image: md5Image ?? this.md5Image,
        releaseDate: releaseDate ?? this.releaseDate,
        tracklist: tracklist ?? this.tracklist,
        type: type ?? this.type,
      );

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        link: json["link"] == null ? null : json["link"],
        cover: json["cover"] == null ? null : json["cover"],
        coverSmall: json["cover_small"] == null ? null : json["cover_small"],
        coverMedium: json["cover_medium"] == null ? null : json["cover_medium"],
        coverBig: json["cover_big"] == null ? null : json["cover_big"],
        coverXl: json["cover_xl"] == null ? null : json["cover_xl"],
        md5Image: json["md5_image"] == null ? null : json["md5_image"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        tracklist: json["tracklist"] == null ? null : json["tracklist"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "link": link == null ? null : link,
        "cover": cover == null ? null : cover,
        "cover_small": coverSmall == null ? null : coverSmall,
        "cover_medium": coverMedium == null ? null : coverMedium,
        "cover_big": coverBig == null ? null : coverBig,
        "cover_xl": coverXl == null ? null : coverXl,
        "md5_image": md5Image == null ? null : md5Image,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "tracklist": tracklist == null ? null : tracklist,
        "type": type == null ? null : type,
      };
}

class Artist {
  Artist({
    this.id,
    this.name,
    this.link,
    this.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.radio,
    this.tracklist,
    this.type,
  });

  dynamic id;
  String name;
  String link;
  String share;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  bool radio;
  String tracklist;
  String type;

  Artist copyWith({
    dynamic id,
    String name,
    String link,
    String share,
    String picture,
    String pictureSmall,
    String pictureMedium,
    String pictureBig,
    String pictureXl,
    bool radio,
    String tracklist,
    String type,
  }) =>
      Artist(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link ?? this.link,
        share: share ?? this.share,
        picture: picture ?? this.picture,
        pictureSmall: pictureSmall ?? this.pictureSmall,
        pictureMedium: pictureMedium ?? this.pictureMedium,
        pictureBig: pictureBig ?? this.pictureBig,
        pictureXl: pictureXl ?? this.pictureXl,
        radio: radio ?? this.radio,
        tracklist: tracklist ?? this.tracklist,
        type: type ?? this.type,
      );

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        link: json["link"] == null ? null : json["link"],
        share: json["share"] == null ? null : json["share"],
        picture: json["picture"] == null ? null : json["picture"],
        pictureSmall:
            json["picture_small"] == null ? null : json["picture_small"],
        pictureMedium:
            json["picture_medium"] == null ? null : json["picture_medium"],
        pictureBig: json["picture_big"] == null ? null : json["picture_big"],
        pictureXl: json["picture_xl"] == null ? null : json["picture_xl"],
        radio: json["radio"] == null ? null : json["radio"],
        tracklist: json["tracklist"] == null ? null : json["tracklist"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "link": link == null ? null : link,
        "share": share == null ? null : share,
        "picture": picture == null ? null : picture,
        "picture_small": pictureSmall == null ? null : pictureSmall,
        "picture_medium": pictureMedium == null ? null : pictureMedium,
        "picture_big": pictureBig == null ? null : pictureBig,
        "picture_xl": pictureXl == null ? null : pictureXl,
        "radio": radio == null ? null : radio,
        "tracklist": tracklist == null ? null : tracklist,
        "type": type == null ? null : type,
      };
}
