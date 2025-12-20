// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/widgets/nav_items.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            gradient: isDark
                ? const LinearGradient(
                    colors: [Color(0xFF1C1C1E), Color(0xFF2A2A2E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : const LinearGradient(
                    colors: [AppColors.whiteColor, AppColors.whitishBlue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isDark
                  ? AppColors.whiteColor.withOpacity(0.08)
                  : AppColors.blackColor.withOpacity(0.05),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
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
        ),
      ),
    );
  }
}
