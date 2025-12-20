// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/constants/constant_string.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBlue : AppColors.whitishBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),

              const SizedBox(height: 24),

              _scanPreview(isDark),

              const SizedBox(height: 20),

              _instructions(),

              const Spacer(),

              _scanButton(),

              const SizedBox(height: 12),

              _secondaryActions(),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Header
  Widget _header(BuildContext context) {
    return const Text(
      ConstantString.scanTitle,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    );
  }

  /// 🔹 Scan Preview Placeholder
  Widget _scanPreview(bool isDark) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.whiteColor.withOpacity(0.05)
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.camera_alt_rounded,
            size: 60,
            color: AppColors.primary.withOpacity(0.8),
          ),

          Positioned(
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                ConstantString.cameraPreview,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Instructions
  Widget _instructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          ConstantString.howToScanTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          ConstantString.howToScanBullets,
          style: TextStyle(color: AppColors.greyColor),
        ),
      ],
    );
  }

  /// 🔹 Primary Scan Button
  Widget _scanButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {}, // later: open camera
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          ConstantString.startScanning,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  /// 🔹 Secondary actions
  Widget _secondaryActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.photo_library_outlined, size: 18),
          label: const Text(ConstantString.uploadImage),
        ),
        const SizedBox(width: 16),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.info_outline, size: 18),
          label: const Text(ConstantString.tips),
        ),
      ],
    );
  }
}
