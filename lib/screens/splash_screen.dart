// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/constants/constant_string.dart';
import 'package:room_vision/screens/auth_screen.dart';
import '../constants/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => AuthScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkNavy, // dark navy
              AppColors.blueSlate, // blue slate
              AppColors.mutedCyanBlue, // muted cyan-blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Soft glow circle (enhances the icon)
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.cyan, // cyan
                        AppColors.blue, // blue
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cyan.withOpacity(0.5),
                        blurRadius: 45,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/app_logo.png", height: 64),
                ),

                const SizedBox(height: 30),

                Text(ConstantString.appName, style: AppTextStyles.splashTitle),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    ConstantString.appDescription,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.splashSubtitle,
                  ),
                ),

                const SizedBox(height: 50),

                const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
