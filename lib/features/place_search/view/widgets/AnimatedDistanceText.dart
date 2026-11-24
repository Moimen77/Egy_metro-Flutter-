import 'package:flutter/material.dart';

class AnimatedDistanceText extends StatelessWidget {
  final double distanceInKm;

  const AnimatedDistanceText({
    super.key,
    required this.distanceInKm,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: distanceInKm),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      builder: (_, v, _) => Text(
        v < 1
            ? '${(v * 1000).round()} م'
            : '${v.toStringAsFixed(2)} كم',
        style: TextStyle(
          color: colors.primary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
