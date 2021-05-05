//import 'album.dart';
import '../data_models/Browser_artist.dart';
import '../data_models/songDataModel.dart';

// TODO: Remove this class and implement this functionality in a function
class Search {
  final String term;
  final List<Song> songs;
  final List<Artist> artists;

  Search({this.songs, this.artists, this.term});

  int get totalCount => songs.length + artists.length;

  bool get isEmpty => totalCount == 0;
}
