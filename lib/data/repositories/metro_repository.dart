import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/logic/grafh/metroGrafh.dart';
import 'package:get/get.dart';

import '../models/station.dart';

class MetroRepository {
  final MetroGraph graph;
  final List<MetroLine> lines;

  MetroRepository({required this.graph, required this.lines});

  // Get all metro stations
  List<Station> getAllStations() {
    return graph.stations.values.toList();
  }

  // Find station using its ID
  Station? getStationById(int stationId) {
    return graph.stations[stationId];
  }

  // Find stations by name
  // Returns a list because the same station name
  // can exist on different metro lines.
  List<Station> findStationsByName(String stationName) {
    final normalizedName = stationName.trim().toLowerCase();

    return graph.stations.values.where((station) {
      return station.name.trim().toLowerCase() == normalizedName;
    }).toList();
  }

  // Get all metro lines
  List<MetroLine> getAllLines() {
    return lines;
  }

  // Get a specific line by ID
  MetroLine? getLineById(int lineId) {
    for (final line in lines) {
      if (line.id == lineId) {
        return line;
      }
    }

    return null;
  }

  void printTest() {
    final repository = Get.find<MetroRepository>();

    print('Total stations: ${repository.getAllStations().length}');
    print('Total lines: ${repository.getAllLines().length}');

    final stations = repository.findStationsByName('Sadat');

    for (final station in stations) {
      print('Station: ${station.name}, ID: ${station.id}');
    }
  }
}
