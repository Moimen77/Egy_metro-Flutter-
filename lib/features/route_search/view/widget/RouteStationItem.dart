import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteStationDirectionBadge.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/RouteStationTimelineIndicator.dart';
import 'package:flutter/material.dart';

class RouteStationItem extends StatelessWidget {
  final Station station;
  final MetroLine? line;
  final String? direction;
  final bool isFirst;
  final bool isLast;
  final bool isTransfer;
  final bool isSegmentStart;

  const RouteStationItem({
    super.key,
    required this.station,
    required this.line,
    required this.direction,
    required this.isFirst,
    required this.isLast,
    required this.isTransfer,
    required this.isSegmentStart,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final showDirection =
        isSegmentStart &&
        direction != null &&
        direction != 'Unknown direction' &&
        direction != 'Same station';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RouteStationTimelineIndicator(
          isFirst: isFirst,
          isLast: isLast,
          lineHeight: showDirection ? 58 : 38,
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
                  line != null ? line!.name : 'الخط ${station.lineId}',
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                if (isTransfer)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'تحويل إلى ${line != null ? line?.name : 'الخط ${station.lineId}'}',
                      style: TextStyle(
                        color: Colors.orange.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (showDirection)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: RouteStationDirectionBadge(direction: direction!),
                  ),
                if (isFirst)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'محطة البداية',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ),
                if (isLast)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'محطة الوصول',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
