import 'package:egypt_metro_navigator/data/sources/metro/metro_graph_builder.dart';
import 'package:egypt_metro_navigator/logic/grafh/metroGrafh.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Build Metro Graph once
    final MetroGraph graph = MetroGraphBuilder.build();

    Get.put<MetroGraph>(graph, permanent: true);
  }
}
