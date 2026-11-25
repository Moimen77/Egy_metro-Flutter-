import 'package:egypt_metro_navigator/app/app_routes.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/FlagStrip.dart';
import 'package:egypt_metro_navigator/features/route_search/controllers/RouteController.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/JourneyInfoCard.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteActionButtons.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteEmptyState.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteErrorBanner.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteSearchHeader.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteStationsCard.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/StationDropdownField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteSearchView extends GetView<RouteController> {
  const RouteSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رحلتك بالمترو'),
        bottom: const FlagStrip(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Obx(
            () => SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RouteSearchHeader(),

                  const SizedBox(height: 24),

                  // Starting Station
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: StationDropdownField(
                          label: 'محطة البداية',
                          hint: 'اختار محطة البداية',
                          icon: Icons.trip_origin,
                          iconColor: Colors.green,
                          value: controller.startStationId.value,
                          stations: controller.stations,
                          onChanged: controller.onStartStationChanged,
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: controller.openGoogleMapsToStartStation,
                        padding: const EdgeInsets.only(top: 25),
                        icon: const Icon(Icons.map_outlined),
                        tooltip: 'Open route in Google Maps',
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Destination Station
                  StationDropdownField(
                    label: 'محطة الوصول',
                    hint: 'اختار محطة الوصول',
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                    value: controller.destinationStationId.value,
                    stations: controller.stations,
                    onChanged: controller.onDestinationStationChanged,
                  ),

                  const SizedBox(height: 24),

                  RouteActionButtons(
                    isCalculating: controller.isCalculating.value,
                    onFindRoute: controller.findRoute,
                    onUseCurrentLocation: () => controller.useCurrentLocation(),
                    onPlaceSearch: () => Get.toNamed(AppRoutes.placeSearch),
                  ),

                  if (controller.errorMessage.value.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    RouteErrorBanner(message: controller.errorMessage.value),
                  ],

                  if (controller.isCalculating.value) ...[
                    const SizedBox(height: 20),
                    const Center(child: CircularProgressIndicator()),
                  ],

                  // Journey Result
                  if (controller.journeyInfo.value != null) ...[
                    const SizedBox(height: 30),
                    const Text(
                      'تفاصيل الرحلة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    JourneyInfoCard(info: controller.journeyInfo.value!),
                    const SizedBox(height: 28),
                    const Text(
                      'محطات الرحلة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    RouteStationsCard(
                      routeStations: controller.routeStations.toList(),
                    ),
                  ],

                  if (controller.journeyInfo.value == null &&
                      controller.errorMessage.value.isEmpty &&
                      !controller.isCalculating.value) ...[
                    const SizedBox(height: 70),
                    const RouteEmptyState(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
