// ignore_for_file: sized_box_for_whitespace

import 'package:coffee_ui/screens/basket_screen/basket_screen.dart';
import 'package:coffee_ui/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

import 'home_screen/main_screen.dart';

class MainMainScreen extends StatefulWidget {
  const MainMainScreen({super.key});

  @override
  State<MainMainScreen> createState() => _MainMainScreenState();
}

class _MainMainScreenState extends State<MainMainScreen> {

int currentIndex = 0;


final screens = [
  const MainScreen(),
const SearchScreen(),
const BasketScreen(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: SweetNavBar(
        currentIndex: currentIndex,
  onTap: (value) {
  setState(() {
    currentIndex = value;

  });
  },
        items: [
          SweetNavBarItem(
              sweetActive: const Icon(
                Icons.home,
                color: Color(0xff531607),
              ),
              sweetIcon: const Icon(
                Icons.home_outlined,
              ),
              sweetLabel: 'Home',
              sweetBackground: Colors.transparent),
          SweetNavBarItem(
              sweetIcon: const Icon(
                Icons.search,
              ),
              sweetActive: const Icon(
                Icons.search,
                color: Color(0xff531607),
              ),
              sweetLabel: 'Serach'),
          SweetNavBarItem(
            sweetActive: const Icon(
              Icons.shopping_cart,
              color: Color(0xff531607),
            ),
            sweetLabel: 'Card',
            sweetIcon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        // onTap: (index) {
        //   setState(() {
        //     cIndex = index;
        //   });
        // },
      ),
      body: screens[currentIndex],
    );
  }
}
