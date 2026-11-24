import 'package:egypt_metro_navigator/data/models/station.dart';

class NearestStationResult {
  final Station station;
  final double distanceInKm;

  const NearestStationResult({
    required this.station,
    required this.distanceInKm,
  });
}
