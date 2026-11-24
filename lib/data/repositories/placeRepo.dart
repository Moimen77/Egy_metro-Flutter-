import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';

import '../../core/services/geocoding_service.dart';

class PlaceRepository {
  final GeocodingService _geocodingService;

  PlaceRepository({required this._geocodingService});

  Future<List<PlaceSuggestion>> searchPlaces(String query) {
    return _geocodingService.searchPlaces(query);
  }
}
