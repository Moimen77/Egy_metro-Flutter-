import 'package:flutter/material.dart';

class StationInfoRow extends StatelessWidget {
  final String label;
  final Widget value;

  const StationInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label), value],
    );
  }
}
