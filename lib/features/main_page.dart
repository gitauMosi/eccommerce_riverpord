import 'package:flutter/material.dart';

import 'cart/presentation/view/cart_screen.dart';
import 'explore/presentation/view/explore_screen.dart';
import 'home/presentation/view/home_screen.dart';
import 'profile/presentation/view/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int itemSelectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  void onItemSelected(int index) {
    setState(() {
      itemSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[itemSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: itemSelectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          
          unselectedItemColor: Colors.grey[300],
          onTap: onItemSelected,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore_rounded),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart_rounded),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person_rounded),
                label: 'Profile')
          ]),
    );
  }
}
