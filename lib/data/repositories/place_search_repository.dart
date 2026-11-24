import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';
import 'package:egypt_metro_navigator/data/repositories/placeRepo.dart';

import '../models/nearest_station_result.dart';
import 'metro_repository.dart';
import '../../logic/services/nearest_station_service.dart';

class PlaceSearchRepository {
  final PlaceRepository placeRepository;
  final MetroRepository metroRepository;
  final NearestStationService nearestStationService;

  PlaceSearchRepository({
    required this.placeRepository,
    required this.metroRepository,
    required this.nearestStationService,
  });

  // Search places using Photon API
  Future<List<PlaceSuggestion>> searchPlaces(String query) {
    return placeRepository.searchPlaces(query);
  }

  // Find nearest metro station to selected place
  NearestStationResult? findNearestStation(PlaceSuggestion place) {
    return nearestStationService.findNearestStation(
      place: place,
      lines: metroRepository.getAllLines(),
    );
  }
}
