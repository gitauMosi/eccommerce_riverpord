import 'package:flutter/material.dart';

import 'cart/presentation/cart_screen.dart';
import 'favourite/presentation/favourite_screen.dart';
import 'home/presentation/home_screen.dart';
import 'profile/presentation/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int itemSelectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
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
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart_rounded),
                label: 'Cart'),
                BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                activeIcon: Icon(Icons.favorite_rounded),
                label: 'Favourites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person_rounded),
                label: 'Profile')
          ]),
    );
  }
}
