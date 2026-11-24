// widgets/error_state.dart
import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String message;
  const ErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48, color: colors.error),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.error),
          ),
        ],
      ),
    );
  }
}
