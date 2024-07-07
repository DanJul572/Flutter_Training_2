import 'package:flutter/material.dart';
import 'package:zapp/screen/about/about.screen.dart';
import 'package:zapp/screen/home/home.screen.dart';
import 'package:zapp/screen/search/search.screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int currentIndex = 1;

  final List<Widget> screens = [
    const SearchScreen(),
    const HomeScreen(),
    const AboutScreen(),
  ];

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
  ];

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items,
        onTap: onTap,
        selectedItemColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: screens[currentIndex],
      ),
    );
  }
}
