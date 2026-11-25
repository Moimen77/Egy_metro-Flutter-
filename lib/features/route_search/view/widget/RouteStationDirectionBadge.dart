import 'package:flutter/material.dart';

class RouteStationDirectionBadge extends StatelessWidget {
  final String direction;

  const RouteStationDirectionBadge({
    super.key,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.directions,
            size: 14,
            color: colors.onPrimaryContainer,
          ),
          const SizedBox(width: 6),
          Text(
            'الاتجاه: $direction',
            style: TextStyle(
              color: colors.onPrimaryContainer,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
