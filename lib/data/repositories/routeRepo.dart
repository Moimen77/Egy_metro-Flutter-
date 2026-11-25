import 'package:egypt_metro_navigator/data/models/JourneyInfo.dart';
import 'package:egypt_metro_navigator/logic/services/journeycalculator.dart';

import '../models/station.dart';
import 'metro_repository.dart';
import '../../logic/services/route_service.dart';

class RouteRepository {
  final MetroRepository metroRepository;
  final RouteService routeService;

  RouteRepository({required this.metroRepository, required this.routeService});

  // Get all stations for dropdown menus.
  List<Station> getAllStations() {
    return metroRepository.getAllStations();
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
