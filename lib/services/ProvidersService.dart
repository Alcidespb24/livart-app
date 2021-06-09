import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/screens/places_api/place_search.dart';
import 'package:flutter_app/screens/places_api/place_service.dart';
import 'package:flutter_app/services/AuthService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'PlacesListService.dart';

final authenticationServiceProvider = Provider((ref) => AuthService());
final authStateChangeProvider = StreamProvider.autoDispose<User>((ref) {
  return ref.watch(authenticationServiceProvider).user;
});

final placeListProvider = Provider<PlacesService>((ref) => PlacesService());

final placeListServiceProvider =
    StateNotifierProvider.autoDispose<PlacesListService, List<PlaceSearch>>(
        (ref) {
  ref.watch(placeListProvider);
  return PlacesListService(ref.watch(placeListProvider));
});
