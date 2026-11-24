// widgets/flag_strip.dart
import 'package:egypt_metro_navigator/core/theme/AppColors.dart';
import 'package:flutter/material.dart';

class FlagStrip extends StatelessWidget implements PreferredSizeWidget {
  const FlagStrip({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(6);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Column(
        children: const [
          Expanded(
            child: ColoredBox(color: EgyptColors.red, child: SizedBox.expand()),
          ),
          Expanded(
            child: ColoredBox(
              color: EgyptColors.white,
              child: SizedBox.expand(),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: EgyptColors.gold,
              child: SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}
