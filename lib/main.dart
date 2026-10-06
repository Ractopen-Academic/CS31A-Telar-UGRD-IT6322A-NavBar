import 'package:flutter/material.dart';
import 'core/theme/google_colors.dart';
import 'presentation/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Navigation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: GoogleColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: GoogleColors.blue,
          surface: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
