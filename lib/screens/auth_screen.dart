// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:room_vision/constants/constant_string.dart';
import 'package:room_vision/constants/text_styles.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/navigation_layout.dart';
import 'package:room_vision/widgets/app_primary_button.dart';
import 'package:room_vision/widgets/app_text_fields.dart';
import 'package:room_vision/widgets/google_signin_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> isLogin = ValueNotifier(true);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _bgController,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.darkNavy,
                  AppColors.blueSlate,
                  AppColors.mutedCyanBlue,
                ],
                stops: [0, 0.5 + (_bgController.value * 0.2), 1],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ValueListenableBuilder(
                    valueListenable: isLogin,
                    builder: (context, value, _) {
                      return Column(
                        children: [
                          _buildLogo(),
                          const SizedBox(height: 30),
                          _buildAuthCard(value),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// LOGO — matches splash exactly
  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.cyan, AppColors.blue],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withOpacity(0.6),
            blurRadius: 45,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Image.asset("assets/images/app_logo.png", height: 48),
    );
  }

  /// AUTH CARD — glass + premium
  Widget _buildAuthCard(bool isLoginMode) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withOpacity(0.07),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.whiteColor.withOpacity(0.15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  isLoginMode
                      ? ConstantString.welcomeBack
                      : ConstantString.createAccount,
                  key: ValueKey(isLoginMode),
                  style: AppTextStyles.authTitle,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                isLoginMode
                    ? ConstantString.loginDescription
                    : ConstantString.signupDescription,
                style: AppTextStyles.authSubtitle,
              ),

              const SizedBox(height: 26),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (!isLoginMode) ...[
                      AppTextField(
                        hint: "Full Name",
                        icon: Icons.person,
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                    ],

                    AppTextField(
                      hint: "Email",
                      icon: Icons.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    AppTextField(
                      hint: "Password",
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              AppPrimaryButton(
                text: isLoginMode
                    ? ConstantString.login
                    : ConstantString.signup,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => NavigationLayout(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR", style: TextStyle(color: Colors.white54)),
                  ),
                  Expanded(child: Divider(color: Colors.white24)),
                ],
              ),

              const SizedBox(height: 20),

              GoogleSignInButton(onPressed: () {}),

              const SizedBox(height: 18),

              Center(
                child: GestureDetector(
                  onTap: () => isLogin.value = !isLogin.value,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      isLoginMode
                          ? ConstantString.dontHaveAccount
                          : ConstantString.alreadyHaveAccount,
                      key: ValueKey(isLoginMode),
                      style: AppTextStyles.switchText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
