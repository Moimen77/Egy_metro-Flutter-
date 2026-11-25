import 'package:egypt_metro_navigator/data/repositories/routeRepo.dart';
import 'package:get/get.dart';

import '../../../data/models/station.dart';
import '../../../data/models/JourneyInfo.dart';
import '../../../data/models/nearest_station_result.dart';

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

  // Nearest station result
  final Rxn<NearestStationResult> nearestStationResult =
      Rxn<NearestStationResult>();

  // UI states
  final RxBool isCalculating = false.obs;
  final RxBool isGettingLocation = false.obs;
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
    nearestStationResult.value = null;
    clearRouteResult();
  }

  // Change destination station
  void onDestinationStationChanged(int? stationId) {
    destinationStationId.value = stationId;
    clearRouteResult();
  }

  // Get current location and select nearest metro station
  Future<void> useCurrentLocation() async {
    if (isGettingLocation.value) return;

    errorMessage.value = '';
    isGettingLocation.value = true;

    try {
      final result = await repository.findNearestStationFromCurrentLocation();

      if (result == null) {
        errorMessage.value = 'No metro stations found';
        return;
      }

      nearestStationResult.value = result;

      // Automatically select nearest station as start station
      startStationId.value = result.station.id;

      clearRouteResult();

      Get.snackbar(
        'Location detected',
        'Nearest station: ${result.station.name}',
      );
    } catch (e) {
      errorMessage.value = _getLocationErrorMessage(e);

      print('Location Error: $e');
    } finally {
      isGettingLocation.value = false;
    }
  }

  String _getLocationErrorMessage(dynamic error) {
    final message = error.toString();

    if (message.contains('disabled')) {
      return 'Please enable location services';
    }

    if (message.contains('permanently denied')) {
      return 'Location permission permanently denied. Enable it from settings';
    }

    if (message.contains('denied')) {
      return 'Location permission denied';
    }

    return 'Unable to get your current location';
  }

  // Calculate route between selected stations
  void findRoute() {
    errorMessage.value = '';

    final startId = startStationId.value;
    final destinationId = destinationStationId.value;

    if (startId == null || destinationId == null) {
      errorMessage.value = 'Please select both stations';
      return;
    }

    if (startId == destinationId) {
      errorMessage.value =
          'Starting station and destination cannot be the same';
      return;
    }

    try {
      isCalculating.value = true;

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

      routeStations.assignAll(result);

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
    nearestStationResult.value = null;

    clearRouteResult();
  }
}
