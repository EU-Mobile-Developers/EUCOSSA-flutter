import 'package:eucossa/scrrens/auth/login.dart';
import 'package:eucossa/scrrens/home/tabs/communities.dart';
import 'package:eucossa/scrrens/home/tabs/hackathons.dart';
import 'package:eucossa/scrrens/home/tabs/main.dart';
import 'package:eucossa/scrrens/home/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _counter = 0;

  // Navigation items based on your project scope
  final List<BottomNavigationItem> _navItems = [
    BottomNavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
      color: Colors.deepPurple,
    ),
    BottomNavigationItem(
      icon: Icons.library_books_outlined,
      activeIcon: Icons.library_books_rounded,
      label: 'Resources',
      color: Colors.blue,
    ),
    BottomNavigationItem(
      icon: Icons.people_outline,
      activeIcon: Icons.people_rounded,
      label: 'Communities',
      color: Colors.green,
    ),
    BottomNavigationItem(
      icon: Icons.event_outlined,
      activeIcon: Icons.event_rounded,
      label: 'Hackathons',
      color: Colors.orange,
    ),
    BottomNavigationItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person_rounded,
      label: 'Profile',
      color: Colors.pink,
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return HomeTab();
      case 1:
        return const PlaceholderScreen(title: 'Resources', icon: Icons.library_books_rounded);
      case 2:
        return CommunitiesPage();
      case 3:
        return HackathonsPage();
      case 4:
        return ProfileScreen();
      default:
        return HomeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          _navItems[_currentIndex].label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.grey[700]),
            onPressed: () {},
            tooltip: 'Notifications',
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.grey[700]),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: _buildCurrentScreen(),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              elevation: 4,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isActive = index == _currentIndex;
              
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isActive ? item.color.withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: isActive ? item.color : Colors.grey[500],
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                          color: isActive ? item.color : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color color;

  BottomNavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.color,
  });
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'This screen is under development',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}