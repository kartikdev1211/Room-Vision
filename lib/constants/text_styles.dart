import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';

class AppTextStyles {
  static const TextStyle splashTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );

  static const TextStyle splashSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );
  static TextStyle authTitle = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );

  static TextStyle authSubtitle = const TextStyle(
    fontSize: 15,
    color: Colors.white70,
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 18,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle switchText = const TextStyle(
    color: AppColors.cyanAccentColor,
    fontSize: 14,
  );
  static TextStyle designText = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
}
