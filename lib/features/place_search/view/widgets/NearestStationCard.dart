// widgets/nearest_station_card.dart
import 'package:egypt_metro_navigator/core/theme/AppColors.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/AnimatedDistanceText.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/LinePadge.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/StationCardHeader.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/StationInfoRow.dart';
import 'package:flutter/material.dart';

class NearestStationCard extends StatelessWidget {
  final String stationName;
  final int lineId;
  final double distanceInKm;

  const NearestStationCard({
    super.key,
    required this.stationName,
    required this.lineId,
    required this.distanceInKm,
  });

  @override
  Widget build(BuildContext context) {
    final lineColor = EgyptColors.lineColor(lineId);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border(right: BorderSide(color: lineColor, width: 6)),
        boxShadow: [
          BoxShadow(
            color: EgyptColors.gold.withOpacity(0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StationCardHeader(
            stationName: stationName,
            lineColor: lineColor,
          ),
          const Divider(height: 28),
          StationInfoRow(
            label: 'الخط',
            value: LineBadge(lineId: lineId),
          ),
          const SizedBox(height: 14),
          StationInfoRow(
            label: 'المسافة التقريبية',
            value: AnimatedDistanceText(distanceInKm: distanceInKm),
          ),
        ],
      ),
    );
  }
}
