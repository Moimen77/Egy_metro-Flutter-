// widgets/selected_place_card.dart
import 'package:flutter/material.dart';

class SelectedPlaceCard extends StatelessWidget {
  final String name;
  final String address;

  const SelectedPlaceCard({
    super.key,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colors.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: Icon(Icons.place, color: colors.primary),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: address.isNotEmpty ? Text(address) : null,
      ),
    );
  }
}
