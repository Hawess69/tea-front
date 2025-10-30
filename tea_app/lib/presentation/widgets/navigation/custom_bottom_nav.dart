import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../core/constants/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Function() onFABPressed;
  
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onFABPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.glassBackground.withValues(alpha: 0.95),
            AppColors.glassBackground.withValues(alpha: 0.85),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border(
          top: BorderSide(
            color: AppColors.border.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Glassmorphic background with blur
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.glassBackground.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
          
          // Navigation items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  label: 'Home',
                  isSelected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                _NavItem(
                  icon: Icons.article_outlined,
                  selectedIcon: Icons.article,
                  label: 'Feed',
                  isSelected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                const SizedBox(width: 64), // Space for FAB
                _NavItem(
                  icon: Icons.forum_outlined,
                  selectedIcon: Icons.forum,
                  label: 'Forum',
                  isSelected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
                _NavItem(
                  icon: Icons.event_outlined,
                  selectedIcon: Icons.event,
                  label: 'Events',
                  isSelected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
          
          // Centered Floating Action Button - On top layer
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onFABPressed,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? selectedIcon : icon,
                key: ValueKey(isSelected),
                color: isSelected 
                    ? AppColors.primary 
                    : AppColors.textSecondary,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: isSelected ? 24 : 0,
              height: 2,
              decoration: BoxDecoration(
                gradient: isSelected ? AppColors.primaryGradient : null,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected 
                    ? AppColors.primary 
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

