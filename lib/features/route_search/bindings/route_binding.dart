import 'package:egypt_metro_navigator/core/services/LocationService.dart';
import 'package:egypt_metro_navigator/data/repositories/routeRepo.dart';
import 'package:egypt_metro_navigator/features/route_search/controllers/RouteController.dart';
import 'package:egypt_metro_navigator/logic/services/nearest_station_service.dart';
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

    Get.lazyPut<NearestStationService>(() => NearestStationService());

    // Route Repository
    Get.lazyPut<RouteRepository>(
      () => RouteRepository(
        metroRepository: Get.find<MetroRepository>(),
        routeService: Get.find<RouteService>(),
        locationService: Get.find<LocationService>(),
        nearestStationService: Get.find<NearestStationService>(),
      ),
    );
    Get.lazyPut<RouteController>(
      () => RouteController(repository: Get.find<RouteRepository>()),
    );
  }
}
