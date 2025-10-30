import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final bool showShadow;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  
  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.showShadow = true,
    this.backgroundColor,
    this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      margin: margin ?? const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.radiusLG),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: AppColors.shadow.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: child,
    );
    
    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.radiusLG),
          child: card,
        ),
      );
    }
    
    return card;
  }
}

