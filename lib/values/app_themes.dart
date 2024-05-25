import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      thumbColor: Colors.blue.shade300,
      activeTrackColor: Colors.blue.shade100,
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );

  static const TextStyle titleSmall = TextStyle(
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: 24,
    color: AppColors.grey,
    fontWeight: FontWeight.w600,
  );
}
