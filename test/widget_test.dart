import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nav1/main.dart';

void main() {
  testWidgets('Complete Login -> Dashboard -> List -> Details -> Profile flow test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 1. Login screen check
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);

    // Tap Sign In to enter dashboard
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // 2. Dashboard screen check (user data passed)
    expect(find.text('Welcome, Alex Rivera!'), findsOneWidget);
    expect(find.text('Overview Metrics'), findsOneWidget);

    // 3. Tab switch to Contacts (Index 1)
    await tester.tap(find.byType(GButton).at(1));
    await tester.pumpAndSettle();

    // Verify Contacts list renders
    expect(find.text('Ada Lovelace'), findsOneWidget);

    // 4. Tap contact to test Redirection to Details screen
    await tester.tap(find.text('Ada Lovelace'));
    await tester.pumpAndSettle();

    // Verify Contact Details screen
    expect(find.text('Contact Info'), findsOneWidget);
    expect(find.text('+1 (555) 181-5184'), findsOneWidget);
    expect(find.text('World’s First Computer Programmer'), findsOneWidget);

    // Pop back to Contacts list
    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Ada Lovelace'), findsOneWidget);

    // 5. Tab switch to Profile & Settings (Index 2)
    await tester.tap(find.byType(GButton).at(2));
    await tester.pumpAndSettle();

    // Verify Profile displays passed user data
    expect(find.text('alex.rivera@gmail.com'), findsOneWidget);
    expect(find.text('Log Out'), findsOneWidget);

    // 6. Test Logout redirection back to Login
    await tester.tap(find.text('Log Out'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
