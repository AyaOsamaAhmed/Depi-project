import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- Raw Tokens ---
  // Primary - Blue Scale
  static const Color primary50 = Color(0xFF001706);
  static const Color primary100 = Color(0xFF80A9DC);
  static const Color primary200 = Color(0xFF739BCC);
  static const Color primary300 = Color(0xFF668CBB);
  static const Color primary400 = Color(0xFF597EAB);
  static const Color primary500 = Color(0xFF3F6089);
  static const Color primary600 = Color(0xFF254368);
  static const Color primary700 = Color(0xFF0B2647);
  static const Color primary800 = Color(0xFF091E39);
  static const Color primary900 = Color(0xFF07172B);
  static const Color primary950 = Color(0xFF040F1C);

  // Secondary - Orange Scale
  static const Color secondary50 = Color(0xFFFFFFFF);
  static const Color secondary100 = Color(0xFFFFF2EB);
  static const Color secondary200 = Color(0xFFFFE5D6);
  static const Color secondary300 = Color(0xFFFFD9C2);
  static const Color secondary400 = Color(0xFFFFCCAD);
  static const Color secondary500 = Color(0xFFFEB284);
  static const Color secondary600 = Color(0xFFFE995B);
  static const Color secondary700 = Color(0xFFFE7F32);
  static const Color secondary800 = Color(0xFFCD6628);
  static const Color secondary900 = Color(0xFF9C4D1E);
  static const Color secondary950 = Color(0xFF6A3514);

  // Gray Scale
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // --- Semantic Tokens ---
  static const Color primaryAction = primary700;
  static const Color ctaButton = secondary700;
  static const Color textDefault = primary800;
  static const Color textLight = gray50;
  static const Color backgroundPageLight = gray50;
  static const Color backgroundPageDark = primary900;
  static const Color danger = Color(0xFFB71C1C);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFE65100);
}
