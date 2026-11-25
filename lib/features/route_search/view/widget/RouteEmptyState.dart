import 'package:flutter/material.dart';

class RouteEmptyState extends StatelessWidget {
  const RouteEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
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
    );
  }
}
