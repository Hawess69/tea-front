import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Sophisticated Rose Gold Palette
  static const Color primary = Color(0xFFFF6B9D); // Soft rose
  static const Color primaryLight = Color(0xFFFFB5DA); // Light rose
  static const Color primaryDark = Color(0xFFE85A89); // Deep rose
  
  // Secondary Colors - Elegant Accents
  static const Color accent = Color(0xFFD4A5FF); // Lavender
  static const Color accentLight = Color(0xFFE9D4FF);
  static const Color accentDark = Color(0xFFB37ACC);
  
  // Tertiary Colors
  static const Color tertiary = Color(0xFFFFB6C1); // Light pink
  static const Color tertiaryLight = Color(0xFFFFDFE8);
  
  // Neutral Colors - Warm & Sophisticated
  static const Color background = Color(0xFFFFFBF8); // Warm white
  static const Color surface = Color(0xFFFFFFFF); // Pure white
  static const Color card = Color(0xFFFFFFFF);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2D2D2D); // Soft black
  static const Color textSecondary = Color(0xFF7B7B7B); // Medium gray
  static const Color textHint = Color(0xFFB0B0B0); // Light gray
  
  // Status Colors
  static const Color error = Color(0xFFFF6B6B);
  static const Color warning = Color(0xFFFFD93D);
  static const Color success = Color(0xFF95E1D3);
  static const Color info = Color(0xFFAED9E0);
  
  // Flag Colors
  static const Color redFlag = Color(0xFFFF6B9D);
  static const Color greenFlag = Color(0xFF95E1D3);
  static const Color neutralFlag = Color(0xFFE8E8E8);
  
  // Border & Divider
  static const Color border = Color(0xFFE8E8E8);
  static const Color divider = Color(0xFFF0F0F0);
  
  // Shadow Colors
  static const Color shadowLight = Color(0x0A000000);
  static const Color shadow = Color(0x1A000000);
  static const Color shadowMedium = Color(0x2E000000);
  static const Color shadowDark = Color(0x47000000);
  
  // Glassmorphism
  static const Color glassBackground = Color(0x80FFFFFF);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF6B9D), Color(0xFFFFB5DA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFD4A5FF), Color(0xFFE9D4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFFFFFBF8), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  // Overlay Colors
  static const Color overlayLight = Color(0x20FFFFFF);
  static const Color overlay = Color(0x40FFFFFF);
  static const Color overlayDark = Color(0x80000000);
}

