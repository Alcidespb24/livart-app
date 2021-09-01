class PlaceSearch {
  final String/*?*/ name;
  final String? placeId;

  PlaceSearch(this.name, this.placeId);

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(json['description'], json['place_id']);
  }
}

