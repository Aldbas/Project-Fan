import 'package:flutter/material.dart';
import 'package:project_fan/home_page.dart';
import 'package:project_fan/team_roster_page.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  List<Widget> _testOptions = [
    HomePage(),
    TeamRosterPage(),
    Placeholder(color: bgColorBlue),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        backgroundColor: bgColorBlue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('TEAM')),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot), title: Text('Matchup')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Players')),
        ]);
  }
}
