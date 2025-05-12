import 'package:flutter/material.dart';
import 'package:weather_app/screens/calendar_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/bottomNavBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void onItemTapped(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [HomeScreen(), SearchScreen(), CalendarScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: _pages,
            onPageChanged: onPageChanged,
            physics: const BouncingScrollPhysics(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Bottomnavbar(
              currentIndex: _selectedIndex,
              onTap: onItemTapped,
            ),
          )
        ],
      ),
    );
  }
}
