import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/nearest_station_result.dart';
import '../../../data/repositories/place_search_repository.dart';

class PlaceSearchController extends GetxController {
  final PlaceSearchRepository repository;

  PlaceSearchController({required this.repository});

  // Text Field
  final TextEditingController searchController = TextEditingController();

  // Search State
  final RxString searchQuery = ''.obs;

  // Suggestions
  final RxList<PlaceSuggestion> suggestions = <PlaceSuggestion>[].obs;

  // Selected Place
  final Rxn<PlaceSuggestion> selectedPlace = Rxn<PlaceSuggestion>();

  // Nearest Station Result
  final Rxn<NearestStationResult> nearestStation = Rxn<NearestStationResult>();

  // Loading States
  final RxBool isLoading = false.obs;
  final RxBool isFindingStation = false.obs;

  // Error State
  final RxString errorMessage = ''.obs;

  int _requestId = 0;

  // Debounce Worker
  Worker? _searchWorker;

  @override
  void onInit() {
    super.onInit();

    _searchWorker = debounce(
      searchQuery,
      _searchPlaces,
      time: const Duration(milliseconds: 500),
    );
  }

  // Called whenever user types
  void onSearchChanged(String value) {
    selectedPlace.value = null;
    nearestStation.value = null;
    errorMessage.value = '';

    searchQuery.value = value.trim();

    if (searchQuery.value.length < 3) {
      _requestId++;
      suggestions.clear();
      isLoading.value = false;
    }
  }

  // Search Places
  Future<void> _searchPlaces(String query) async {
    if (query.length < 3) {
      suggestions.clear();
      return;
    }

    final currentRequestId = ++_requestId;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final results = await repository.searchPlaces(query);

      // Ignore outdated responses
      if (currentRequestId != _requestId) return;

      suggestions.assignAll(results);
    } catch (e) {
      if (currentRequestId != _requestId) return;

      suggestions.clear();
      errorMessage.value = 'Failed to search places';

      debugPrint('Place Search Error: $e');
    } finally {
      if (currentRequestId == _requestId) {
        isLoading.value = false;
      }
    }
  }

  // Select Place
  void selectPlace(PlaceSuggestion place) {
    selectedPlace.value = place;

    searchController.text = place.name;

    searchQuery.value = '';

    suggestions.clear();
    errorMessage.value = '';

    findNearestStation();
  }

  // Find Nearest Metro Station
  void findNearestStation() {
    final place = selectedPlace.value;

    if (place == null) return;

    try {
      isFindingStation.value = true;

      final result = repository.findNearestStation(place);

      nearestStation.value = result;

      if (result == null) {
        errorMessage.value = 'No metro stations found';
      }
    } catch (e) {
      nearestStation.value = null;
      errorMessage.value = 'Failed to find nearest station';

      debugPrint('Nearest Station Error: $e');
    } finally {
      isFindingStation.value = false;
    }
  }

  // Clear Search
  void clearSearch() {
    _requestId++;

    searchController.clear();
    searchQuery.value = '';

    suggestions.clear();
    selectedPlace.value = null;
    nearestStation.value = null;

    errorMessage.value = '';
    isLoading.value = false;
    isFindingStation.value = false;
  }

  @override
  void onClose() {
    _requestId++;

    _searchWorker?.dispose();
    searchController.dispose();

    super.onClose();
  }
}
