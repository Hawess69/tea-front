import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.primaryDark,
    surface: AppColors.surface,
    background: AppColors.background,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: AppColors.textPrimary,
    onBackground: AppColors.textPrimary,
    onError: Colors.white,
  ),
  
  scaffoldBackgroundColor: AppColors.background,
  
  // Typography
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.4,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: 0.5,
    ),
  ),
  
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.surface.withValues(alpha: 0.8),
    foregroundColor: AppColors.textPrimary,
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    actionsIconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),
    titleTextStyle: GoogleFonts.inter(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  
  cardTheme: CardTheme(
    elevation: AppSpacing.elevation1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
    ),
    margin: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
  ),
  
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.md,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    labelStyle: const TextStyle(color: AppColors.textSecondary),
    hintStyle: const TextStyle(color: AppColors.textHint),
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: AppSpacing.elevation1,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      ),
      side: const BorderSide(color: AppColors.primary, width: 2),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: AppSpacing.elevation2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
    ),
  ),
  
  iconTheme: const IconThemeData(
    color: AppColors.textSecondary,
    size: 24,
  ),
  
  dividerTheme: const DividerThemeData(
    color: AppColors.divider,
    thickness: 0.5,
    space: 1,
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.primaryDark,
    surface: const Color(0xFF1E1E1E),
    background: const Color(0xFF121212),
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
  ),
  
  scaffoldBackgroundColor: const Color(0xFF121212),
  
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: const Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);

