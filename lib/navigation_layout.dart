import 'package:flutter/material.dart';
import 'package:room_vision/screens/design_screen.dart';
import 'package:room_vision/screens/home_screen.dart';
import 'package:room_vision/screens/profile_screen.dart';
import 'package:room_vision/screens/scan_screen.dart';
import 'package:room_vision/widgets/custom_navbar.dart';

class NavigationLayout extends StatefulWidget {
  const NavigationLayout({super.key});

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeScreen(),
      ScanScreen(),
      DesignScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
