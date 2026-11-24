// widgets/line_badge.dart
import 'package:egypt_metro_navigator/core/theme/AppColors.dart';
import 'package:flutter/material.dart';

class LineBadge extends StatelessWidget {
  final int lineId;
  const LineBadge({super.key, required this.lineId});

  @override
  Widget build(BuildContext context) {
    final color = EgyptColors.lineColor(lineId);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'الخط ${EgyptColors.displayLine(lineId)}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
