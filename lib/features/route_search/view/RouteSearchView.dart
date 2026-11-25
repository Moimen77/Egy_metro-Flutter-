import 'package:egypt_metro_navigator/app/app_routes.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/FlagStrip.dart';
import 'package:egypt_metro_navigator/features/route_search/controllers/RouteController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/station.dart';

class RouteSearchView extends GetView<RouteController> {
  const RouteSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
                  const Text(
                    'حدد رحلتك',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'اختار محطة البداية ومحطة الوصول لمعرفة أفضل طريق.',
                    style: TextStyle(
                      color: colors.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Starting Station
                  _buildStationDropdown(
                    label: 'محطة البداية',
                    hint: 'اختار محطة البداية',
                    icon: Icons.trip_origin,
                    iconColor: Colors.green,
                    value: controller.startStationId.value,
                    stations: controller.stations,
                    onChanged: controller.onStartStationChanged,
                  ),

                  const SizedBox(height: 18),

                  // Destination Station
                  _buildStationDropdown(
                    label: 'محطة الوصول',
                    hint: 'اختار محطة الوصول',
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                    value: controller.destinationStationId.value,
                    stations: controller.stations,
                    onChanged: controller.onDestinationStationChanged,
                  ),

                  const SizedBox(height: 24),

                  // Calculate Route Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: controller.isCalculating.value
                          ? null
                          : controller.findRoute,
                      icon: const Icon(Icons.alt_route),
                      label: const Text(
                        'احسب الطريق',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Place Search Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () => Get.toNamed(AppRoutes.placeSearch),
                      icon: const Icon(Icons.location_searching),
                      label: const Text(
                        'ابحث عن أقرب محطة لمكان محدد',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  if (controller.errorMessage.value.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.errorContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: colors.onErrorContainer),
                      ),
                    ),
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

                    _buildJourneyInfo(colors),

                    const SizedBox(height: 28),

                    const Text(
                      'محطات الرحلة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _buildRouteStations(colors),
                  ],

                  if (controller.journeyInfo.value == null &&
                      controller.errorMessage.value.isEmpty &&
                      !controller.isCalculating.value) ...[
                    const SizedBox(height: 70),
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.directions_subway_outlined,
                            size: 65,
                            color: colors.outline,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'اختار محطتين عشان نحددلك الطريق',
                            style: TextStyle(
                              color: colors.onSurfaceVariant,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Station Dropdown
  Widget _buildStationDropdown({
    required String label,
    required String hint,
    required IconData icon,
    required Color iconColor,
    required int? value,
    required List<Station> stations,
    required ValueChanged<int?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<int>(
          value: value,
          isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: iconColor),
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          items: stations.map((station) {
            return DropdownMenuItem<int>(
              value: station.id,
              child: Text(
                '${station.name} - Line ${station.lineId}',
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Journey Information Card
  Widget _buildJourneyInfo(ColorScheme colors) {
    final info = controller.journeyInfo.value!;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    icon: Icons.confirmation_number_outlined,
                    title: 'سعر التذكرة',
                    value: '${info.ticketPrice} جنيه',
                    color: colors.primary,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    icon: Icons.access_time,
                    title: 'الوقت المتوقع',
                    value: '${info.estimatedMinutes} دقيقة',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    icon: Icons.train_outlined,
                    title: 'عدد المحطات',
                    value: '${info.stationsTravelled}',
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    icon: Icons.swap_horiz,
                    title: 'عدد التحويلات',
                    value: '${info.transfers}',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 25),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }

  // Route Stations
  Widget _buildRouteStations(ColorScheme colors) {
    final route = controller.routeStations;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: List.generate(route.length, (index) {
            final station = route[index];
            final isFirst = index == 0;
            final isLast = index == route.length - 1;

            final isTransfer =
                index > 0 && station.lineId != route[index - 1].lineId;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      isFirst
                          ? Icons.trip_origin
                          : isLast
                          ? Icons.location_on
                          : Icons.circle,
                      size: isFirst || isLast ? 24 : 12,
                      color: isFirst
                          ? Colors.green
                          : isLast
                          ? Colors.red
                          : colors.primary,
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 38,
                        color: colors.outlineVariant,
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'الخط ${station.lineId}',
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        if (isTransfer)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'تحويل إلى الخط ${station.lineId}',
                              style: TextStyle(
                                color: Colors.orange.shade800,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        if (isFirst)
                          const Text(
                            'محطة البداية',
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        if (isLast)
                          const Text(
                            'محطة الوصول',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
