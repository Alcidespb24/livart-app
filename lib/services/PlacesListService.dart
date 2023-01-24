import 'package:flutter_app/data_models/place_search.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlacesListService extends StateNotifier<List<PlaceSearch>?>{
  PlacesListService(this._placesService):super([]);
  final _placesService;

  Future<void> searchPlace (String searchTerm) async {
    state = await _placesService.getAutocomplete(searchTerm);
  }
}