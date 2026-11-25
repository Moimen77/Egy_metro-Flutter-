import 'package:flutter/material.dart';

class RouteActionButtons extends StatelessWidget {
  final bool isCalculating;
  final VoidCallback onFindRoute;
  final VoidCallback onUseCurrentLocation;
  final VoidCallback onPlaceSearch;

  const RouteActionButtons({
    super.key,
    required this.isCalculating,
    required this.onFindRoute,
    required this.onUseCurrentLocation,
    required this.onPlaceSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: isCalculating ? null : onFindRoute,
            icon: const Icon(Icons.alt_route),
            label: const Text(
              'احسب الطريق',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton.icon(
            onPressed: onUseCurrentLocation,
            icon: const Icon(Icons.location_searching),
            label: const Text(
              'ابحث عن أقرب محطة لمكانك',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton.icon(
            onPressed: onPlaceSearch,
            icon: const Icon(Icons.location_searching),
            label: const Text(
              'ابحث عن أقرب محطة لمكان محدد',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
