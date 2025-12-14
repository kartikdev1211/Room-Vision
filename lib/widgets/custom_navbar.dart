// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:room_vision/widgets/nav_items.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final int itemCount = 4;
    final double totalWidth = MediaQuery.of(context).size.width - 32;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  // More opaque background that works on white
                  color: isDark
                      ? Colors.grey[900]?.withOpacity(0.85)
                      : Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.2),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Animated moving indicator background
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      alignment: Alignment.lerp(
                        Alignment(-1.0, 0),
                        Alignment(1.0, 0),
                        itemCount == 1 ? 0 : (currentIndex / (itemCount - 1)),
                      )!,
                      child: Container(
                        width: totalWidth / itemCount - 14,
                        height: 48,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NavItem(
                          icon: Icons.dashboard_rounded,
                          label: 'Home',
                          index: 0,
                          currentIndex: currentIndex,
                          onTap: onTap,
                        ),
                        NavItem(
                          icon: Icons.camera_alt_rounded,
                          label: 'Scan',
                          index: 1,
                          currentIndex: currentIndex,
                          onTap: onTap,
                        ),
                        NavItem(
                          icon: Icons.chair_rounded,
                          label: 'Design',
                          index: 2,
                          currentIndex: currentIndex,
                          onTap: onTap,
                        ),
                        NavItem(
                          icon: Icons.person_rounded,
                          label: 'Profile',
                          index: 3,
                          currentIndex: currentIndex,
                          onTap: onTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
