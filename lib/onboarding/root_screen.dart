import 'package:flutter/material.dart';
import 'package:moviers/onboarding/account_screen.dart';
import 'package:moviers/onboarding/homeScreen.dart';
import 'package:moviers/onboarding/search_screen.dart';
import 'package:moviers/onboarding/watchlist_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WatchlistScreen(),
    AccountScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A0A0A),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white54,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color:
                  _currentIndex == 0
                      ? const Color(0xFF1F80FF)
                      : Colors.white54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_outlined,
              color:
                  _currentIndex == 1
                      ? const Color(0xFF1F80FF)
                      : Colors.white54,
            ),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color:
                  _currentIndex == 2
                      ? const Color(0xFF1F80FF)
                      : Colors.white54,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      _currentIndex == 3
                          ? const Color(0xFF1F80FF)
                          : Colors.transparent,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage(
                  'assets/images/mine.jpg',
                ),
                backgroundColor: Colors.grey.shade800,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
