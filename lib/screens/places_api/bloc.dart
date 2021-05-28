import 'package:flutter/material.dart';
import 'package:flutter_app/screens/places_api/place_search.dart';
import 'package:flutter_app/screens/places_api/place_service.dart';


class Bloc with ChangeNotifier {
  final placesService = PlacesService();

  List<PlaceSearch> searchResults;

  searchPlace (String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }
}