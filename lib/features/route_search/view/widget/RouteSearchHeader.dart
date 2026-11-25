import 'package:flutter/material.dart';

class RouteSearchHeader extends StatelessWidget {
  const RouteSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
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
      ],
    );
  }
}
