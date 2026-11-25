import 'package:egypt_metro_navigator/core/services/LocationService.dart';
import 'package:egypt_metro_navigator/data/repositories/metro_repository.dart';
import 'package:egypt_metro_navigator/data/sources/metro/metro_data.dart';
import 'package:egypt_metro_navigator/data/sources/metro/metro_graph_builder.dart';
import 'package:egypt_metro_navigator/logic/grafh/metroGrafh.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Build Metro Graph once
    final MetroGraph graph = MetroGraphBuilder.build();

    Get.put<MetroGraph>(graph, permanent: true);
    Get.put<LocationService>(LocationService());
    // 3. Register Metro Repository
    Get.put<MetroRepository>(
      MetroRepository(graph: graph, lines: allLines),
      permanent: true,
    );
  }
}
