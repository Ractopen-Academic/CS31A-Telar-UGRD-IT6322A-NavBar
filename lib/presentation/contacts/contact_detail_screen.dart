import 'package:flutter/material.dart';
import '../../core/theme/google_colors.dart';
import '../../domain/models/contact.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  const ContactDetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final initial = contact.name.isNotEmpty ? contact.name[0] : '?';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: GoogleColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Contact Info',
          style: TextStyle(
            color: GoogleColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 46,
                    backgroundColor: contact.avatarColor.withValues(alpha: 0.16),
                    child: Text(
                      initial,
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: contact.avatarColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: GoogleColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact.role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: GoogleColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.phone_outlined, 'Call', contact.avatarColor),
                _buildActionButton(Icons.message_outlined, 'Text', contact.avatarColor),
                _buildActionButton(Icons.email_outlined, 'Email', contact.avatarColor),
              ],
            ),
            const SizedBox(height: 28),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFFE8EAED)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.phone_rounded, color: contact.avatarColor),
                      title: const Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 12, color: GoogleColors.darkGrey),
                      ),
                      subtitle: Text(
                        contact.phone,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: GoogleColors.textPrimary,
                        ),
                      ),
                    ),
                    const Divider(height: 1, indent: 56, color: Color(0xFFF1F3F4)),
                    ListTile(
                      leading: Icon(Icons.mail_outline_rounded, color: contact.avatarColor),
                      title: const Text(
                        'Gmail',
                        style: TextStyle(fontSize: 12, color: GoogleColors.darkGrey),
                      ),
                      subtitle: Text(
                        contact.email,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: GoogleColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
