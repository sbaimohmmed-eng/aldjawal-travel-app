import 'package:flutter/material.dart';

/// Application color palette matching the Aldjawal branding
class AppColors {
  // Primary Colors
  static const Color darkNavy = Color(0xFF0A192F);
  static const Color orange = Color(0xFFFF6B35);
  static const Color charcoal = Color(0xFF1E1E1E);
  static const Color white = Color(0xFFFFFFFF);

  // Status Colors
  static const Color visaFree = Color(0xFF10B981); // Emerald Green
  static const Color eVisa = Color(0xFFF59E0B); // Amber
  static const Color visaRequired = Color(0xFFEF4444); // Red
  static const Color processing = Color(0xFF3B82F6); // Blue

  // Utility Colors
  static const Color greyLight = Color(0xFF9CA3AF);
  static const Color greyDark = Color(0xFF4B5563);
  static const Color errorRed = Color(0xFFDC2626);
  static const Color successGreen = Color(0xFF059669);

  // Opacity variants
  static Color orangeWithOpacity(double opacity) =>
      orange.withOpacity(opacity);
  static Color visaFreeWithOpacity(double opacity) =>
      visaFree.withOpacity(opacity);
  static Color eVisaWithOpacity(double opacity) =>
      eVisa.withOpacity(opacity);
}
