// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/constants/constant_string.dart';
import 'package:room_vision/constants/text_styles.dart';
import 'package:room_vision/widgets/action_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() => _visible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF121212)
          : const Color(0xFFF6F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _animate(delay: 0, child: _header(context)),

              const SizedBox(height: 20),

              _animate(delay: 80, child: _hero(context)),

              const SizedBox(height: 24),

              _animate(
                delay: 140,
                child: const Text(
                  ConstantString.quickActions,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 12),

              _animate(delay: 200, child: _grid()),

              const SizedBox(height: 24),

              _animate(
                delay: 260,
                child: const Text(
                  ConstantString.recentDesigns,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 12),

              _animate(delay: 320, child: _recent(isDark)),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Animation wrapper
  Widget _animate({required Widget child, int delay = 0}) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: _visible ? 1 : 0,
      curve: Curves.easeOut,
      child: AnimatedSlide(
        duration: Duration(milliseconds: 400 + delay),
        curve: Curves.easeOutCubic,
        offset: _visible ? Offset.zero : const Offset(0, 0.08),
        child: child,
      ),
    );
  }

  /// 🔹 Header
  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          ConstantString.appName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.15),
          child: const Icon(Icons.person),
        ),
      ],
    );
  }

  /// 🔹 Hero
  Widget _hero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstantString.designYourRoomTitle,
            style: AppTextStyles.designText,
          ),
          SizedBox(height: 8),
          Text(
            ConstantString.scanDescription,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  /// 🔹 Grid
  Widget _grid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: const [
        ActionCard(
          icon: Icons.camera_alt_rounded,
          title: ConstantString.actionScanRoom,
        ),
        ActionCard(
          icon: Icons.chair_rounded,
          title: ConstantString.actionDesignLayout,
        ),
        ActionCard(
          icon: Icons.auto_awesome_rounded,
          title: ConstantString.actionAISuggestions,
        ),
        ActionCard(
          icon: Icons.history_rounded,
          title: ConstantString.actionPreviousDesigns,
        ),
      ],
    );
  }

  /// 🔹 Recent
  Widget _recent(bool isDark) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          ConstantString.noDesignsYet,
          style: TextStyle(color: AppColors.greyColor),
        ),
      ),
    );
  }
}
