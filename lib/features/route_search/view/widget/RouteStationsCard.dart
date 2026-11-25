import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';
import 'package:egypt_metro_navigator/data/sources/metro/metro_data.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteStationItem.dart';
import 'package:flutter/material.dart';

class RouteStationsCard extends StatelessWidget {
  final List<Station> routeStations;

  const RouteStationsCard({
    super.key,
    required this.routeStations,
  });

  List<List<Station>> _buildSegments() {
    final List<List<Station>> segments = [];

    for (final station in routeStations) {
      if (segments.isEmpty || segments.last.last.lineId != station.lineId) {
        segments.add([station]);
      } else {
        segments.last.add(station);
      }
    }

    return segments;
  }

  String _getDirection(
    MetroLine line,
    Station start,
    Station destination,
  ) {
    final startIndex = line.stations.indexWhere(
      (station) => station.id == start.id,
    );

    final destinationIndex = line.stations.indexWhere(
      (station) => station.id == destination.id,
    );

    if (startIndex == -1 || destinationIndex == -1) {
      return 'Unknown direction';
    }

    if (startIndex < destinationIndex) {
      return line.directions[1];
    }

    if (startIndex > destinationIndex) {
      return line.directions[0];
    }

    return 'Same station';
  }

  @override
  Widget build(BuildContext context) {
    final segments = _buildSegments();
    final List<Widget> rows = [];
    int globalIndex = 0;

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final line = allLines.cast<MetroLine?>().firstWhere(
        (l) => l?.id == segment.first.lineId,
        orElse: () => null,
      );
      final direction = line == null
          ? null
          : _getDirection(line, segment.first, segment.last);

      for (int j = 0; j < segment.length; j++) {
        rows.add(
          RouteStationItem(
            station: segment[j],
            line: line,
            direction: direction,
            isFirst: globalIndex == 0,
            isLast: globalIndex == routeStations.length - 1,
            isTransfer: i > 0 && j == 0,
            isSegmentStart: j == 0,
          ),
        );
        globalIndex++;
      }
    }

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(children: rows),
      ),
    );
  }
}
