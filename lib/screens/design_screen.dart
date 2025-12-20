// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/constants/constant_string.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBlue : AppColors.whitishBlue,

      bottomNavigationBar: _bottomActions(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 24),
              _roomPreview(isDark),
              const SizedBox(height: 24),
              _designOptions(),
              const SizedBox(height: 24),
              _styleSuggestions(),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Header
  Widget _header(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 8),
        const Text(
          ConstantString.designLayoutTitle,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  // 🔹 Room preview
  Widget _roomPreview(bool isDark) {
    return AspectRatio(
      aspectRatio: 0.85,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: const Center(
          child: Text(
            ConstantString.roomPreview,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // 🔹 Design options
  Widget _designOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ConstantString.adjustLayout,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _OptionChip(label: ConstantString.optionMinimal),
            _OptionChip(label: ConstantString.optionModern),
            _OptionChip(label: ConstantString.optionLuxury),
            _OptionChip(label: ConstantString.optionCompact),
          ],
        ),
      ],
    );
  }

  // 🔹 AI suggestions (placeholder)
  Widget _styleSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ConstantString.aiSuggestions,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: const Text(
            ConstantString.aiSuggestionsBullets,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  // 🔹 Bottom actions
  Widget _bottomActions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {},
            child: const Text(
              ConstantString.generateAILayout,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: const Text(ConstantString.resetLayout),
          ),
        ],
      ),
    );
  }
}

// 🔹 Option chip
class _OptionChip extends StatelessWidget {
  final String label;
  const _OptionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: AppColors.navActiveBackground,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
