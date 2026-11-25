import 'package:egypt_metro_navigator/data/repositories/routeRepo.dart';
import 'package:egypt_metro_navigator/features/route_search/controllers/RouteController.dart';
import 'package:get/get.dart';

import '../../../data/repositories/metro_repository.dart';
import '../../../logic/services/route_service.dart';

class RouteBinding extends Bindings {
  @override
  void dependencies() {
    // Route Service
    Get.lazyPut<RouteService>(
      () => RouteService(repository: Get.find<MetroRepository>()),
    );

    // Route Repository
    Get.lazyPut<RouteRepository>(
      () => RouteRepository(
        metroRepository: Get.find<MetroRepository>(),
        routeService: Get.find<RouteService>(),
      ),
    );
    Get.lazyPut<RouteController>(
      () => RouteController(repository: Get.find<RouteRepository>()),
    );
  }
}
