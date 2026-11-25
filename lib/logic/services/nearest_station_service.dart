import 'dart:math';

import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/nearest_station_result.dart';
import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

class NearestStationService {
  // Search using a selected place
  NearestStationResult? findNearestStation({
    required PlaceSuggestion place,
    required List<MetroLine> lines,
  }) {
    return findNearestStationByCoordinates(
      latitude: place.latitude,
      longitude: place.longitude,
      lines: lines,
    );
  }

  // Search using GPS coordinates
  NearestStationResult? findNearestStationByCoordinates({
    required double latitude,
    required double longitude,
    required List<MetroLine> lines,
  }) {
    Station? nearestStation;
    double minDistance = double.infinity;

    for (final line in lines) {
      for (final station in line.stations) {
        final distance = _calculateDistance(
          lat1: latitude,
          lon1: longitude,
          lat2: station.latitude,
          lon2: station.longitude,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestStation = station;
        }
      }
    }

    if (nearestStation == null) return null;

    return NearestStationResult(
      station: nearestStation,
      distanceInKm: minDistance,
    );
  }

  double _calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const earthRadius = 6371.0;

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a =
        pow(sin(dLat / 2), 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * pow(sin(dLon / 2), 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degree) => degree * pi / 180;
}
