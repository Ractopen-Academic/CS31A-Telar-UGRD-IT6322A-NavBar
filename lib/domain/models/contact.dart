import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  final String role;
  final Color avatarColor;

  const Contact({
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.avatarColor,
  });
}
