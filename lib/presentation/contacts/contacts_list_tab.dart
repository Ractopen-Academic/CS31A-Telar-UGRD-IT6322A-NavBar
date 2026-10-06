import 'package:flutter/material.dart';
import '../../core/theme/google_colors.dart';
import '../../data/repositories/contact_repository.dart';
import 'contact_detail_screen.dart';

class ContactsListTab extends StatelessWidget {
  const ContactsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = ContactRepository.famousContacts;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: contacts.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        indent: 68,
        color: Color(0xFFF1F3F4),
      ),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        final initial = contact.name.isNotEmpty ? contact.name[0] : '?';

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: contact.avatarColor.withValues(alpha: 0.16),
            child: Text(
              initial,
              style: TextStyle(
                color: contact.avatarColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          title: Text(
            contact.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: GoogleColors.textPrimary,
            ),
          ),
          subtitle: Text(
            contact.email,
            style: const TextStyle(
              fontSize: 13,
              color: GoogleColors.darkGrey,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF9AA0A6),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactDetailScreen(contact: contact),
              ),
            );
          },
        );
      },
    );
  }
}
