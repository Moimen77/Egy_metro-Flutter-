import 'package:egypt_metro_navigator/data/sources/metro/MetroTransfer.dart';
import 'package:egypt_metro_navigator/data/sources/metro/metro_data.dart';
import 'package:egypt_metro_navigator/logic/grafh/metroGrafh.dart';

class MetroGraphBuilder {
  static MetroGraph build() {
    final graph = MetroGraph();

    for (final line in allLines) {
      graph.addLine(line);
    }

    addMetroTransfers(graph, allLines);

    return graph;
  }
}
