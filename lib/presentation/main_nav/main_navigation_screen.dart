import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../core/theme/google_colors.dart';
import '../../domain/models/user.dart';
import '../auth/login_screen.dart';
import '../contacts/contacts_list_tab.dart';
import '../dashboard/dashboard_tab.dart';
import '../profile/profile_settings_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserModel user;

  const MainNavigationScreen({super.key, required this.user});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  static const List<String> _titles = [
    'Dashboard',
    'Contacts',
    'Profile & Settings',
  ];

  static const List<Color> _tabColors = [
    GoogleColors.blue,
    GoogleColors.green,
    GoogleColors.red,
  ];

  void _onSelectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = _tabColors[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            _titles[_selectedIndex],
            key: ValueKey<String>(_titles[_selectedIndex]),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: activeColor,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: GoogleColors.blue,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  widget.user.name.isNotEmpty ? widget.user.name[0] : 'U',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: GoogleColors.blue,
                  ),
                ),
              ),
              accountName: Text(
                widget.user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(widget.user.email),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded, color: GoogleColors.blue),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(context);
                _onSelectTab(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts_rounded, color: GoogleColors.green),
              title: const Text('Contacts List'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(context);
                _onSelectTab(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded, color: GoogleColors.red),
              title: const Text('Profile & Settings'),
              selected: _selectedIndex == 2,
              onTap: () {
                Navigator.pop(context);
                _onSelectTab(2);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: GoogleColors.darkGrey),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_selectedIndex),
          child: _buildCurrentTab(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.06),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: GNav(
              curve: Curves.easeInOutCubic,
              duration: const Duration(milliseconds: 400),
              gap: 8,
              iconSize: 24,
              tabBorderRadius: 16,
              color: GoogleColors.darkGrey,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              selectedIndex: _selectedIndex,
              onTabChange: _onSelectTab,
              tabs: [
                GButton(
                  icon: Icons.dashboard_rounded,
                  text: 'Dashboard',
                  iconActiveColor: GoogleColors.blue,
                  textColor: GoogleColors.blue,
                  backgroundColor: GoogleColors.blue.withValues(alpha: 0.12),
                  rippleColor: GoogleColors.blue.withValues(alpha: 0.2),
                ),
                GButton(
                  icon: Icons.contacts_rounded,
                  text: 'Contacts',
                  iconActiveColor: GoogleColors.green,
                  textColor: GoogleColors.green,
                  backgroundColor: GoogleColors.green.withValues(alpha: 0.12),
                  rippleColor: GoogleColors.green.withValues(alpha: 0.2),
                ),
                GButton(
                  icon: Icons.settings_rounded,
                  text: 'Profile',
                  iconActiveColor: GoogleColors.red,
                  textColor: GoogleColors.red,
                  backgroundColor: GoogleColors.red.withValues(alpha: 0.12),
                  rippleColor: GoogleColors.red.withValues(alpha: 0.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentTab() {
    switch (_selectedIndex) {
      case 0:
        return DashboardTab(
          user: widget.user,
          onViewContacts: () => _onSelectTab(1),
        );
      case 1:
        return const ContactsListTab();
      case 2:
      default:
        return ProfileSettingsTab(
          user: widget.user,
          onLogout: _logout,
        );
    }
  }
}
