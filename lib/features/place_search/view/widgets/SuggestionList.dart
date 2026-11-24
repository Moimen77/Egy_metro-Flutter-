// widgets/suggestions_list.dart
import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SuggestionsList extends StatelessWidget {
  final List<PlaceSuggestion> items;
  final ValueChanged onSelected;

  const SuggestionsList({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final place = items[index];

        return Card(
              color: Colors.white,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                leading: CircleAvatar(
                  backgroundColor: colors.primaryContainer,
                  child: Icon(
                    Icons.location_on_outlined,
                    color: colors.primary,
                  ),
                ),
                title: Text(
                  place.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: place.displayAddress.isNotEmpty
                    ? Text(place.displayAddress)
                    : null,
                onTap: () => onSelected(place),
              ),
            )
            .animate(delay: (40 * index).ms)
            .fadeIn(duration: 300.ms)
            .slideY(begin: 0.15, curve: Curves.easeOut);
      },
    );
  }
}
