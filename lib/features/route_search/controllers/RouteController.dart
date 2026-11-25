import 'package:egypt_metro_navigator/data/repositories/routeRepo.dart';
import 'package:get/get.dart';

import '../../../data/models/station.dart';
import '../../../data/models/JourneyInfo.dart';

class RouteController extends GetxController {
  final RouteRepository repository;

  RouteController({required this.repository});

  // All metro stations
  final RxList<Station> stations = <Station>[].obs;

  // Selected stations
  final Rxn<int> startStationId = Rxn<int>();
  final Rxn<int> destinationStationId = Rxn<int>();

  // Route result
  final RxList<Station> routeStations = <Station>[].obs;
  final Rxn<JourneyInfo> journeyInfo = Rxn<JourneyInfo>();

  // UI states
  final RxBool isCalculating = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadStations();
  }

  // Load all stations for dropdowns
  void loadStations() {
    try {
      stations.assignAll(repository.getAllStations());
    } catch (e) {
      errorMessage.value = 'Failed to load stations';
    }
  }

  // Change starting station
  void onStartStationChanged(int? stationId) {
    startStationId.value = stationId;
    clearRouteResult();
  }

  // Change destination station
  void onDestinationStationChanged(int? stationId) {
    destinationStationId.value = stationId;
    clearRouteResult();
  }

  // Calculate route between selected stations
  void findRoute() {
    errorMessage.value = '';

    final startId = startStationId.value;
    final destinationId = destinationStationId.value;

    // Validate selections
    if (startId == null || destinationId == null) {
      errorMessage.value = 'Please select both stations';
      return;
    }

    // Prevent selecting the same station
    if (startId == destinationId) {
      errorMessage.value =
          'Starting station and destination cannot be the same';
      return;
    }

    try {
      isCalculating.value = true;

      // Find shortest route using BFS
      final result = repository.findRoute(
        startStationId: startId,
        destinationStationId: destinationId,
      );

      if (result == null || result.isEmpty) {
        routeStations.clear();
        journeyInfo.value = null;
        errorMessage.value = 'No route found between these stations';
        return;
      }

      // Save route stations
      routeStations.assignAll(result);

      // Calculate journey information
      journeyInfo.value = repository.calculateJourney(result);
    } catch (e) {
      routeStations.clear();
      journeyInfo.value = null;
      errorMessage.value = 'Failed to calculate route';

      print('Route Calculation Error: $e');
    } finally {
      isCalculating.value = false;
    }
  }

  // Clear previous route result
  void clearRouteResult() {
    routeStations.clear();
    journeyInfo.value = null;
    errorMessage.value = '';
  }

  // Reset all selections and results
  void clearAll() {
    startStationId.value = null;
    destinationStationId.value = null;

    clearRouteResult();
  }
}
