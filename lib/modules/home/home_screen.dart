// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_screen.dart';
import 'package:grocery_nepal/modules/explore_tab/explore_screen.dart';
import 'package:grocery_nepal/modules/order_tab/order_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/profile_screen.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    ExploreScreen(),
    CartScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: greyColor,
        selectedItemColor: greenColor,
        items: [
          _bottomNavigationBarItem(Icons.grid_view, "Explore"),
          _bottomNavigationBarItem(Icons.shopping_cart_outlined, "Cart"),
          _bottomNavigationBarItem(Icons.receipt_long_outlined, "My Orders"),
          _bottomNavigationBarItem(Icons.person_outline, "Profile"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.grid_view), label: "Explore"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.receipt_long_outlined), label: "My Orders"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
    );
  }
}
