// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      button: true,
      selected: isActive,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          splashColor: AppColors.cyanAccentColor.withOpacity(0.1),
          highlightColor: AppColors.cyanAccentColor.withOpacity(0.05),
          onTap: () => onTap(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            constraints: const BoxConstraints(minHeight: 48, minWidth: 60),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon with scale animation
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  tween: Tween(begin: 1.0, end: isActive ? 1.0 : 1.0),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Icon(
                        icon,
                        color: isActive
                            ? AppColors.cyanAccentColor
                            : isDark
                            ? Colors.white.withOpacity(0.6)
                            : Colors.black.withOpacity(0.5),
                        size: isActive ? 26 : 24,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 4),

                // Label with fade and slide animation
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  style: TextStyle(
                    fontSize: isActive ? 12 : 11,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive
                        ? AppColors.cyanAccentColor
                        : isDark
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.5),
                    letterSpacing: 0.3,
                  ),
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
