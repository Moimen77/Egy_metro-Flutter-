import 'package:flutter/material.dart';

class StationCardHeader extends StatelessWidget {
  final String stationName;
  final Color lineColor;

  const StationCardHeader({
    super.key,
    required this.stationName,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: lineColor.withOpacity(0.12),
          child: Icon(Icons.directions_subway, color: lineColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اسم المحطة',
                style: TextStyle(
                  fontSize: 12,
                  color: colors.onSurfaceVariant,
                ),
              ),
              Text(
                stationName,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
