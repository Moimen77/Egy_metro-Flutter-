// widgets/search_field.dart
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final bool showClear;

  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.showClear,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'مثلاً: Nasr City',
        prefixIcon: Icon(Icons.search, color: colors.primary),
        suffixIcon: showClear
            ? IconButton(onPressed: onClear, icon: const Icon(Icons.close))
            : null,
      ),
    );
  }
}
