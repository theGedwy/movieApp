import 'package:flutter/material.dart';
import 'package:movies_app/core/custom_bottom_nav_bar.dart';
import 'package:movies_app/screens/home/home_view.dart';
import 'package:movies_app/screens/profile/profile_view.dart';
import 'package:movies_app/screens/search/search_view.dart';
import 'package:movies_app/screens/wishlist/wishlist_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    WishlistView(),
    ProfileView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
