import 'package:flutter/material.dart';
import '../../core/theme/google_colors.dart';
import '../../data/repositories/contact_repository.dart';
import '../../domain/models/user.dart';

class DashboardTab extends StatelessWidget {
  final UserModel user;
  final VoidCallback onViewContacts;

  const DashboardTab({
    super.key,
    required this.user,
    required this.onViewContacts,
  });

  @override
  Widget build(BuildContext context) {
    final contactsCount = ContactRepository.famousContacts.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [GoogleColors.blue, Color(0xFF1A73E8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: GoogleColors.blue.withValues(alpha: 0.25),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${user.name}!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  user.email,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: onViewContacts,
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: GoogleColors.blue,
                  ),
                  child: const Text('View Contacts List'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Overview Metrics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: GoogleColors.textPrimary,
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  title: 'Contacts',
                  value: '$contactsCount',
                  icon: Icons.people_alt_rounded,
                  color: GoogleColors.blue,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _buildMetricCard(
                  title: 'Favorites',
                  value: '3',
                  icon: Icons.favorite_rounded,
                  color: GoogleColors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  title: 'Storage',
                  value: '84%',
                  icon: Icons.cloud_done_rounded,
                  color: GoogleColors.yellowDark,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _buildMetricCard(
                  title: 'Security',
                  value: 'Healthy',
                  icon: Icons.shield_rounded,
                  color: GoogleColors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EAED)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: GoogleColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
