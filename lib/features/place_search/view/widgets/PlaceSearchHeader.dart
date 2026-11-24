import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlaceSearchHeader extends StatelessWidget {
  const PlaceSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ابحث عن مكانك',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ).animate().fadeIn().slideX(begin: 0.1),
        const SizedBox(height: 8),
        Text(
          'اكتب اسم المنطقة أو المكان لمعرفة أقرب محطة مترو ليك.',
          style: TextStyle(
            color: colors.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
