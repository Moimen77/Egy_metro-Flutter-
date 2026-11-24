import 'package:egypt_metro_navigator/data/models/MetroLine.dart';

class Station {
  final int id;
  final String name;
  final int lineId;
  final double latitude;
  final double longitude;

  const Station({
    required this.id,
    required this.name,
    required this.lineId,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() => '$name (Line $lineId)';
}

Station? findStation(List<MetroLine> lines, int lineId, String stationName) {
  for (final line in lines) {
    if (line.id != lineId) continue;

    for (final station in line.stations) {
      if (station.name == stationName) {
        return station;
      }
    }
  }

  return null;
}

Station findStationsV2(List<MetroLine> lines, String stationName) {
  final List<Station> results = [];

  for (final line in lines) {
    for (final station in line.stations) {
      if (station.name.toLowerCase().trim() ==
          stationName.toLowerCase().trim()) {
        results.add(station);
      }
    }
  }

  return results.first;
}
