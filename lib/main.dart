import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';
import 'package:room_vision/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoomVision',
      debugShowCheckedModeBanner: false,

      // 🔹 Follow system theme
      themeMode: ThemeMode.system,

      // 🔹 Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.whitishBlue,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.cyan,
          surface: AppColors.whitishBlue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whitishBlue,
          elevation: 0,
          foregroundColor: AppColors.blackColor,
        ),
      ),

      // 🔹 Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBlue,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.cyan,
          surface: AppColors.darkBlue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBlue,
          elevation: 0,
          foregroundColor: AppColors.whiteColor,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}
