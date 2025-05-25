import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 20,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      elevation: 0,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF0A1F2C),
      selectedItemColor: Colors.yellow[700],
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
