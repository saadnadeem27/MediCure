import 'package:flutter/material.dart';

class AppColors {
  // Premium Healthcare Colors - Enhanced
  static const Color primaryBlue = Color(0xFF667eea);
  static const Color primaryTeal = Color(0xFF26D0CE);
  static const Color primaryGreen = Color(0xFF4ECDC4);
  static const Color primaryPurple = Color(0xFF764ba2);

  // Ultra Premium Gradient Colors
  static const Color ultraBlue = Color(0xFF1A2980);
  static const Color neonTeal = Color(0xFF26D0CE);
  static const Color electricBlue = Color(0xFF6B73FF);
  static const Color cosmicPurple = Color(0xFF9A4FC0);
  static const Color medicalGreen = Color(0xFF00C9A7);

  // Glassmorphism Colors
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassBlue = Color(0x1A667eea);
  static const Color glassTeal = Color(0x1A26D0CE);
  static const Color glassPurple = Color(0x1A764ba2);

  // Premium Gradient Combinations
  static const List<Color> premiumGradient = [
    Color(0xFF667eea),
    Color(0xFF764ba2),
  ];

  static const List<Color> medicalGradient = [
    Color(0xFF26D0CE),
    Color(0xFF1A2980),
  ];

  static const List<Color> healingGradient = [
    Color(0xFF4ECDC4),
    Color(0xFF44A08D),
  ];

  static const List<Color> ultraGradient = [
    Color(0xFF667eea),
    Color(0xFF764ba2),
    Color(0xFF6B73FF),
  ];

  static const List<Color> cosmicGradient = [
    Color(0xFF1A2980),
    Color(0xFF26D0CE),
    Color(0xFF9A4FC0),
  ];

  // Glass Card Gradients
  static const List<Color> glassCardGradient = [
    Color(0x40FFFFFF),
    Color(0x20FFFFFF),
  ];

  static const List<Color> premiumCardGradient = [
    Color(0xFFFFFFFF),
    Color(0xFFF8FAFF),
  ];

  // Advanced Background Gradients
  static const List<Color> backgroundGradient = [
    Color(0xFFF8FAFF),
    Color(0xFFE8F4FD),
    Color(0xFFF1F8FF),
  ];

  static const List<Color> premiumBackgroundGradient = [
    Color(0xFF667eea),
    Color(0xFF764ba2),
    Color(0xFF6B73FF),
  ];

  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textLight = Color(0xFFBDC3C7);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFFAFBFC);

  // Status Colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // Additional UI Colors
  static const Color primary = Color(0xFF667eea);
  static const Color accent = Color(0xFF26D0CE);
  static const Color divider = Color(0xFFE0E0E0);

  // Neutral Colors
  static const Color grey100 = Color(0xFFF8F9FA);
  static const Color grey200 = Color(0xFFE9ECEF);
  static const Color grey300 = Color(0xFFDEE2E6);
  static const Color grey400 = Color(0xFFCED4DA);
  static const Color grey500 = Color(0xFFADB5BD);
  static const Color grey600 = Color(0xFF6C757D);
  static const Color grey700 = Color(0xFF495057);
  static const Color grey800 = Color(0xFF343A40);
  static const Color grey900 = Color(0xFF212529);

  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowHeavy = Color(0x4D000000);

  // Shimmer Colors
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  // Specialty Colors for Healthcare
  static const Color cardiology = Color(0xFFE91E63);
  static const Color neurology = Color(0xFF9C27B0);
  static const Color orthopedic = Color(0xFF795548);
  static const Color pediatric = Color(0xFFFF9800);
  static const Color dermatology = Color(0xFF607D8B);
  static const Color gynecology = Color(0xFFE91E63);
  static const Color dentistry = Color(0xFF00BCD4);
  static const Color ophthalmology = Color(0xFF3F51B5);

  // Glass Effect Colors
  static const Color glassPrimary = Color(0x80FFFFFF);
  static const Color glassSecondary = Color(0x40FFFFFF);

  // Gradient Constructors - Enhanced
  static LinearGradient get primaryLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: premiumGradient,
      );

  static LinearGradient get secondaryLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: medicalGradient,
      );

  static LinearGradient get medicalLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: medicalGradient,
      );

  static LinearGradient get accentLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: healingGradient,
      );

  static LinearGradient get cardLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: premiumCardGradient,
      );

  static LinearGradient get backgroundLinearGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: backgroundGradient,
      );

  // Ultra Premium Gradients
  static LinearGradient get ultraLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: ultraGradient,
        stops: [0.0, 0.5, 1.0],
      );

  static LinearGradient get cosmicLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: cosmicGradient,
        stops: [0.0, 0.5, 1.0],
      );

  // Glassmorphism Gradients
  static LinearGradient get glassLinearGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: glassCardGradient,
      );

  // Advanced Gradient Effects
  static RadialGradient get radialGradient => const RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [
          Color(0xFF667eea),
          Color(0xFF764ba2),
        ],
      );

  static SweepGradient get sweepGradient => const SweepGradient(
        center: Alignment.center,
        colors: [
          Color(0xFF667eea),
          Color(0xFF26D0CE),
          Color(0xFF764ba2),
          Color(0xFF667eea),
        ],
      );

  // Additional Status Gradients
  static LinearGradient get warningGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFF39C12), Color(0xFFE67E22)],
      );

  static LinearGradient get errorGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE74C3C), Color(0xFFC0392B)],
      );

  static LinearGradient get successGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF27AE60), Color(0xFF2ECC71)],
      );
}
