import 'package:flutter/material.dart';
import 'package:room_vision/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBlue : AppColors.whitishBlue,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 24),

              _profileCard(isDark),
              const SizedBox(height: 24),

              _statsRow(),
              const SizedBox(height: 32),

              _sectionTitle('Preferences'),
              const SizedBox(height: 12),
              _settingsTile(Icons.dark_mode_rounded, 'Dark Mode'),
              _settingsTile(Icons.notifications_rounded, 'Notifications'),

              const SizedBox(height: 24),

              _sectionTitle('Account'),
              const SizedBox(height: 12),
              _settingsTile(Icons.history_rounded, 'My Designs'),
              _settingsTile(Icons.cloud_upload_rounded, 'Backup'),
              _settingsTile(Icons.security_rounded, 'Privacy & Security'),

              const SizedBox(height: 32),

              _logoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Header
  Widget _header() {
    return const Text(
      'Profile',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }

  // 🔹 Profile card
  Widget _profileCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.primary.withOpacity(0.15),
            child: const Icon(Icons.person, size: 36),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Guest User',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 4),
              Text('guest@roomvision.ai', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Stats
  Widget _statsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _StatItem(title: 'Scans', value: '12'),
        _StatItem(title: 'Designs', value: '7'),
        _StatItem(title: 'Saved', value: '4'),
      ],
    );
  }

  // 🔹 Section title
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  // 🔹 Settings tile
  Widget _settingsTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {},
      ),
    );
  }

  // 🔹 Logout
  Widget _logoutButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.logout_rounded),
        label: const Text('Logout'),
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

// 🔹 Stat item widget
class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
