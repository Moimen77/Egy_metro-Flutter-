import 'package:egypt_metro_navigator/data/models/nearest_station_result.dart';
import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/NearestStationCard.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/SectionLabel.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/SelectedPlaceCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlaceSearchResult extends StatelessWidget {
  final PlaceSuggestion selectedPlace;
  final NearestStationResult result;

  const PlaceSearchResult({
    super.key,
    required this.selectedPlace,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('المكان المختار'),
          const SizedBox(height: 10),
          SelectedPlaceCard(
            name: selectedPlace.name,
            address: selectedPlace.displayAddress,
          ),
          const SizedBox(height: 24),
          const SectionLabel('أقرب محطة مترو ليك'),
          const SizedBox(height: 10),
          NearestStationCard(
                stationName: result.station.name,
                lineId: result.station.lineId,
                distanceInKm: result.distanceInKm,
              )
              .animate()
              .fadeIn(duration: 400.ms)
              .slideY(begin: 0.15, curve: Curves.easeOutBack),
          const SizedBox(height: 12),
          Text(
            'المسافة محسوبة جغرافياً بين المكان والمحطة، '
            'وليست مسافة المشي الفعلية.',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
