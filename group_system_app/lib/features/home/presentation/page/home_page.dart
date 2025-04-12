import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    Container(
      child: Center(
        child: Text("Page 1"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Page 2"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Page 3"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: AppColors.primaryDark,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: (index) {
          // print("Index: $index");
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
