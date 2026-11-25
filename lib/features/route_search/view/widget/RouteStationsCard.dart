import 'package:egypt_metro_navigator/data/models/station.dart';
import 'package:flutter/material.dart';

class RouteStationsCard extends StatelessWidget {
  final List<Station> routeStations;

  const RouteStationsCard({
    super.key,
    required this.routeStations,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: List.generate(routeStations.length, (index) {
            final station = routeStations[index];
            final isFirst = index == 0;
            final isLast = index == routeStations.length - 1;

            final isTransfer =
                index > 0 && station.lineId != routeStations[index - 1].lineId;

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
