import 'package:flutter_app/data_models/place_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class PlacesService {
  final apiKey = 'AIzaSyDnbmGjkWDR62tjBwpYAcKMhkCRPBKPamY';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=establishment&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = (json['predictions'] as List)
        .map((place) => PlaceSearch.fromJson(place))
        .toList();
    return result;
  }

  Future<PlaceSearch> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return PlaceSearch.fromJson(jsonResult);
  }
}