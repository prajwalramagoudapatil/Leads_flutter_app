
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_alt_outlined),
          label: 'Leads',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart_outlined),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_outlined),
          label: 'More',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black38,
      unselectedLabelStyle: TextStyle(
        color: Colors.black38,
      ),
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
