import 'package:egypt_metro_navigator/data/repositories/placeRepo.dart';
import 'package:egypt_metro_navigator/features/place_search/controllers/place_search_controller.dart';
import 'package:get/get.dart';

import '../../../core/services/geocoding_service.dart';
import '../../../data/repositories/metro_repository.dart';
import '../../../data/repositories/place_search_repository.dart';
import '../../../logic/services/nearest_station_service.dart';

class PlaceSearchBinding extends Bindings {
  @override
  void dependencies() {
    // Geocoding Service
    Get.lazyPut<GeocodingService>(() => GeocodingService());

    // Place Repository
    Get.lazyPut<PlaceRepository>(
      () => PlaceRepository(geocodingService: Get.find<GeocodingService>()),
    );

    // Nearest Station Service
    Get.lazyPut<NearestStationService>(() => NearestStationService());

    // Place Search Repository
    Get.lazyPut<PlaceSearchRepository>(
      () => PlaceSearchRepository(
        placeRepository: Get.find<PlaceRepository>(),
        metroRepository: Get.find<MetroRepository>(),
        nearestStationService: Get.find<NearestStationService>(),
      ),
    );

    // Controller
    Get.lazyPut<PlaceSearchController>(
      () =>
          PlaceSearchController(repository: Get.find<PlaceSearchRepository>()),
    );
  }
}
