import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:dipe_freelance/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundPageLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary700,
        onPrimary: Colors.white,
        secondary: AppColors.secondary700,
        onSecondary: Colors.white,
        error: AppColors.danger,
        surface: AppColors.backgroundPageLight,
        onSurface: AppColors.primary800,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1.copyWith(color: AppColors.primary800),
        displayMedium: AppTextStyles.h2.copyWith(color: AppColors.primary800),
        displaySmall: AppTextStyles.h3.copyWith(color: AppColors.primary800),
        headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.primary800),
        bodyLarge: AppTextStyles.bodyL.copyWith(color: AppColors.primary800),
        bodyMedium: AppTextStyles.bodyM.copyWith(color: AppColors.primary800),
        bodySmall: AppTextStyles.bodyS.copyWith(color: AppColors.primary800),
        labelLarge: AppTextStyles.buttonL.copyWith(color: AppColors.primary800),
        labelMedium: AppTextStyles.buttonS.copyWith(color: AppColors.primary800),
        labelSmall: AppTextStyles.smallLabel.copyWith(color: AppColors.primary800),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundPageDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary100,
        onPrimary: AppColors.primary800,
        secondary: AppColors.secondary400,
        onSecondary: AppColors.secondary900,
        error: AppColors.danger,
        surface: AppColors.backgroundPageDark,
        onSurface: AppColors.gray50,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1.copyWith(color: AppColors.gray50),
        displayMedium: AppTextStyles.h2.copyWith(color: AppColors.gray50),
        displaySmall: AppTextStyles.h3.copyWith(color: AppColors.gray50),
        headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.gray50),
        bodyLarge: AppTextStyles.bodyL.copyWith(color: AppColors.gray50),
        bodyMedium: AppTextStyles.bodyM.copyWith(color: AppColors.gray50),
        bodySmall: AppTextStyles.bodyS.copyWith(color: AppColors.gray50),
        labelLarge: AppTextStyles.buttonL.copyWith(color: AppColors.gray50),
        labelMedium: AppTextStyles.buttonS.copyWith(color: AppColors.gray50),
        labelSmall: AppTextStyles.smallLabel.copyWith(color: AppColors.gray50),
      ),
    );
  }
}
