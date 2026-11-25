import 'package:egypt_metro_navigator/data/models/station.dart';
import 'package:flutter/material.dart';

class StationDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final Color iconColor;
  final int? value;
  final List<Station> stations;
  final ValueChanged<int?> onChanged;

  const StationDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.stations,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<int>(
          value: value,
          isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: iconColor),
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          items: stations.map((station) {
            return DropdownMenuItem<int>(
              value: station.id,
              child: Text(
                '${station.name} - Line ${station.lineId}',
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
