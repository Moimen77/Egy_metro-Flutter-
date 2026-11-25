import 'package:egypt_metro_navigator/core/services/LocationService.dart';
import 'package:egypt_metro_navigator/data/models/JourneyInfo.dart';
import 'package:egypt_metro_navigator/data/models/nearest_station_result.dart';
import 'package:egypt_metro_navigator/logic/services/journeycalculator.dart';
import 'package:egypt_metro_navigator/logic/services/nearest_station_service.dart';

import '../models/station.dart';
import 'metro_repository.dart';
import '../../logic/services/route_service.dart';

class RouteRepository {
  final MetroRepository metroRepository;
  final RouteService routeService;
  final LocationService locationService;
  final NearestStationService nearestStationService;

  RouteRepository({
    required this.metroRepository,
    required this.routeService,
    required this.locationService,
    required this.nearestStationService,
  });

  // Get all stations for dropdown menus.
  List<Station> getAllStations() {
    return metroRepository.getAllStations();
  }

  // Get nearest metro station to current GPS location.
  Future<NearestStationResult?> findNearestStationFromCurrentLocation() async {
    final position = await locationService.getCurrentLocation();

    return nearestStationService.findNearestStationByCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
      lines: metroRepository.getAllLines(),
    );
  }

  JourneyInfo calculateJourney(List<Station> route) {
    return JourneyCalculator.calculate(route);
  }

  // Find route between two stations.
  List<Station>? findRoute({
    required int startStationId,
    required int destinationStationId,
  }) {
    return routeService.findRoute(
      startStationId: startStationId,
      destinationStationId: destinationStationId,
    );
  }
}
