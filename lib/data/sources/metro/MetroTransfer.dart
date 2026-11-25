import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';
import 'package:egypt_metro_navigator/logic/grafh/metroGrafh.dart';

void addMetroTransfers(MetroGraph graph, List<MetroLine> lines) {
  // Sadat: Line 1 <-> Line 2
  connectStations(
    graph,
    lines,
    line1Id: 1,
    station1Name: 'السادات',
    line2Id: 2,
    station2Name: 'السادات',
  );

  // Shohadaa: Line 1 <-> Line 2
  connectStations(
    graph,
    lines,
    line1Id: 1,
    station1Name: 'الشهداء',
    line2Id: 2,
    station2Name: 'الشهداء',
  );

  // Ataba: Line 2 <-> Line 3
  connectStations(
    graph,
    lines,
    line1Id: 2,
    station1Name: 'العتبة',
    line2Id: 3,
    station2Name: 'العتبة',
  );
  connectStations(
    graph,
    lines,
    line1Id: 3,
    station1Name: 'الكيت كات',
    line2Id: 4,
    station2Name: 'الكيت كات',
  );
  connectStations(
    graph,
    lines,
    line1Id: 2,
    station1Name: 'جامعة القاهرة',
    line2Id: 4,
    station2Name: 'جامعة القاهرة',
  );
}

void connectStations(
  MetroGraph graph,
  List<MetroLine> lines, {
  required int line1Id,
  required String station1Name,
  required int line2Id,
  required String station2Name,
}) {
  final station1 = findStation(lines, line1Id, station1Name);

  final station2 = findStation(lines, line2Id, station2Name);

  if (station1 == null || station2 == null) {
    throw Exception(
      'Transfer station not found: '
      '$station1Name / $station2Name',
    );
  }

  graph.addConnection(station1.id, station2.id, isTransfer: true);
}
