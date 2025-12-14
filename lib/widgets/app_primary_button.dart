// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/constants/text_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF22D3EE), Color(0xFF3B82F6)],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.blueAccentColor.withOpacity(0.6),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(text, style: AppTextStyles.buttonText),
        ),
      ),
    );
  }
}
