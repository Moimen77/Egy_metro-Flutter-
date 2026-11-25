import 'package:flutter/material.dart';

class RouteStationTimelineIndicator extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final double lineHeight;

  const RouteStationTimelineIndicator({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
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
            height: lineHeight,
            color: colors.outlineVariant,
          ),
      ],
    );
  }
}
