import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../data_models/Browser_artist.dart';
import '../data_models/songDataModel.dart';
import '../music_browser_api/search.dart';

class AppleMusicStore {
  AppleMusicStore._privateConstructor();

  static final AppleMusicStore instance = AppleMusicStore._privateConstructor();
  static const BASE_URL = 'https://api.deezer.com';
  static const GENRE_URL = "$BASE_URL/genres";
  static const _SONG_URL = "$BASE_URL/songs";
  static const _ARTIST_URL = "$BASE_URL/artist";
  static const _SEARCH_URL = "$BASE_URL/search";
  static const JWT_KEY = 'fraHqOefFZ2zYgsfC1nRPcNBONGxaehnNR5RGwv3wiWOxG5vUqB';

  Future<dynamic> _fetchJSON(String url) async {
    final response =
    await get(Uri.parse(url), headers: {'Authorization': "Bearer $JWT_KEY"});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Song> fetchSongById(String id) async {
    final json = await _fetchJSON("$_SONG_URL/$id");
    return Song.fromJson(json['data'][0]);
  }

  Future<Artist> fetchArtistById(int id) async {
    final jsonArtist = await _fetchJSON("$_ARTIST_URL/$id");
    final trackLink = jsonArtist['tracklist'];
    final jsonSong = await _fetchJSON("$trackLink");
    return Artist.fromJson(jsonArtist,jsonSong);
  }

  Future<Search> search(String query) async {
    final urlArtist = "$_SEARCH_URL/artist?q=$query";
    final urlTrack = "$_SEARCH_URL/track?q=$query";

    final encodedArtist = Uri.encodeFull(urlArtist);
    final encodedTrack = Uri.encodeFull(urlTrack);

    final jsonArtist = await _fetchJSON(encodedArtist);
    final jsonTrack = await _fetchJSON(encodedTrack);

    final List<Song> songs = [];
    final List<Artist> artists = [];

    final artistJSON = jsonArtist['data'] as List;
    if (artistJSON != null) {
      artists
          .addAll((artistJSON).map((a) => Artist.fromJson(a,null)));
    }

    final songJSON = jsonTrack['data'] as List;
    if (songJSON != null) {
      songs.addAll((songJSON).map((a) => Song.fromJson(a)));
    }

    return Search(songs: songs, artists: artists, term: query);
  }

}