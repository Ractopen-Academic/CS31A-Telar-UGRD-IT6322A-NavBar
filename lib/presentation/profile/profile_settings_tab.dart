import 'package:flutter/material.dart';
import '../../core/theme/google_colors.dart';
import '../../domain/models/user.dart';

class ProfileSettingsTab extends StatelessWidget {
  final UserModel user;
  final VoidCallback onLogout;

  const ProfileSettingsTab({
    super.key,
    required this.user,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE8EAED)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: GoogleColors.blue.withValues(alpha: 0.14),
                  child: Text(
                    user.name.isNotEmpty ? user.name[0] : 'U',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: GoogleColors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: GoogleColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 13,
                          color: GoogleColors.darkGrey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.role,
                        style: const TextStyle(
                          fontSize: 12,
                          color: GoogleColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFE8EAED)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications_none_rounded, color: GoogleColors.darkGrey),
                  title: const Text('Notifications'),
                  subtitle: const Text('Push alerts, sounds'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56, color: Color(0xFFF1F3F4)),
                ListTile(
                  leading: const Icon(Icons.lock_outline_rounded, color: GoogleColors.darkGrey),
                  title: const Text('Security & Password'),
                  subtitle: const Text('2-Step verification active'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56, color: Color(0xFFF1F3F4)),
                ListTile(
                  leading: const Icon(Icons.palette_outlined, color: GoogleColors.darkGrey),
                  title: const Text('App Theme'),
                  subtitle: const Text('Google Material 3 Light'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          OutlinedButton.icon(
            onPressed: onLogout,
            icon: const Icon(Icons.logout_rounded, color: GoogleColors.red),
            label: const Text(
              'Log Out',
              style: TextStyle(
                color: GoogleColors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: GoogleColors.red.withValues(alpha: 0.3)),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
