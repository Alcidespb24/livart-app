import 'songDataModel.dart';

class Artist {
  final int id;
  final String type;
  final String link;
  final String name;

  final List<SongModel> songs;

  Artist({this.id, this.type, this.link, this.name, this.songs});

  factory Artist.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> jsonSong) {
    final List<SongModel> songs = [];

    final relationshipJSON = jsonSong != null ? jsonSong['data'] as List : null;
    if (relationshipJSON != null) {
      final songsJSON = relationshipJSON;
      if (songsJSON != null) {
        songs.addAll((songsJSON).map((s) => SongModel.fromJson(s)));
      }
    }

    return Artist(
        id: json['id'],
        type: json['type'],
        link: json['link'],
        name: json['name'],
        songs: songs);
  }
}
