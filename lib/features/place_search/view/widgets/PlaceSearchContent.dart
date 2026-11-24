import 'package:egypt_metro_navigator/Widgets/EmptyState.dart';
import 'package:egypt_metro_navigator/Widgets/ErrorState.dart';
import 'package:egypt_metro_navigator/data/models/nearest_station_result.dart';
import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/PlaceSearchResult.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/SuggestionList.dart';
import 'package:flutter/material.dart';

class PlaceSearchContent extends StatelessWidget {
  final bool isLoading;
  final String errorMessage;
  final List<PlaceSuggestion> suggestions;
  final PlaceSuggestion? selectedPlace;
  final NearestStationResult? nearestStation;
  final ValueChanged<PlaceSuggestion> onSelectPlace;

  const PlaceSearchContent({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.suggestions,
    required this.selectedPlace,
    required this.nearestStation,
    required this.onSelectPlace,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      child: _buildStateWidget(),
    );
  }

  Widget _buildStateWidget() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return ErrorState(message: errorMessage);
    }

    if (suggestions.isNotEmpty && selectedPlace == null) {
      return SuggestionsList(
        items: suggestions,
        onSelected: (place) => onSelectPlace(place),
      );
    }

    if (nearestStation != null && selectedPlace != null) {
      return PlaceSearchResult(
        selectedPlace: selectedPlace!,
        result: nearestStation!,
      );
    }

    return const EmptyState(key: ValueKey('empty'));
  }
}
