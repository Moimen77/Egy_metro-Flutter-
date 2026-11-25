import 'package:egypt_metro_navigator/app/app_routes.dart';
import 'package:egypt_metro_navigator/features/place_search/view/PlaceSearchView.dart';
import 'package:egypt_metro_navigator/features/route_search/bindings/route_binding.dart';
import 'package:egypt_metro_navigator/features/route_search/view/RouteSearchView.dart';
import 'package:get/get.dart';

import '../features/place_search/bindings/place_search_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.placeSearch,
      page: () => const PlaceSearchView(),
      binding: PlaceSearchBinding(),
    ),
    GetPage(
      name: AppRoutes.routeSearch,
      page: () => const RouteSearchView(),
      binding: RouteBinding(),
    ),
  ];
}
