// core/theme/egypt_colors.dart
import 'package:flutter/material.dart';

class EgyptColors {
  EgyptColors._();

  static const red = Color(0xFFCE1126);
  static const black = Color(0xFF111111);
  static const gold = Color(0xFFC09300);
  static const white = Color(0xFFFFFFFF);
  static const cream = Color(0xFFFAF6EE);

  // ألوان خطوط المترو
  static const line1 = Color(0xFF1E5BB8);
  static const line2 = Color(0xFFD32F2F);
  static const line3 = Color(0xFF2E7D32);

  /// الفرع (id = 4) تابع للخط التالت.
  static int displayLine(int lineId) => lineId == 4 ? 3 : lineId;

  static Color lineColor(int lineId) {
    switch (displayLine(lineId)) {
      case 1:
        return line1;
      case 2:
        return line2;
      case 3:
        return line3;
      default:
        return black;
    }
  }
}
