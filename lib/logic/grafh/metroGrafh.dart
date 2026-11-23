import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/edge.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

class MetroGraph {
  final Map<int, List<Edge>> adjacencyList = {};

  final Map<int, Station> stations = {};

  // Add Node
  void addStation(Station station) {
    stations[station.id] = station;
    adjacencyList.putIfAbsent(station.id, () => []);
  }

  // Add Connection
  void addConnection(int station1, int station2, {bool isTransfer = false}) {
    if (!stations.containsKey(station1) || !stations.containsKey(station2)) {
      throw ArgumentError('Station does not exist in graph');
    }

    final firstNeighbors = adjacencyList[station1]!;
    final secondNeighbors = adjacencyList[station2]!;

    final alreadyConnected = firstNeighbors.any(
      (edge) => edge.destinationId == station2 && edge.isTransfer == isTransfer,
    );

    if (alreadyConnected) return;

    firstNeighbors.add(Edge(destinationId: station2, isTransfer: isTransfer));

    secondNeighbors.add(Edge(destinationId: station1, isTransfer: isTransfer));
  }

  // Build Line
  void addLine(MetroLine line) {
    for (final station in line.stations) {
      addStation(station);
    }

    for (int i = 0; i < line.stations.length - 1; i++) {
      addConnection(line.stations[i].id, line.stations[i + 1].id);
    }
  }

  // Get Neighbors
  List<Edge> getNeighbors(int stationId) {
    return adjacencyList[stationId] ?? [];
  }
}
