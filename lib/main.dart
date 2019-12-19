import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_fan/home_page.dart';

import 'Standings.dart';
import 'playerTile.dart';
import 'players_profile.dart';
import 'team_roster_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.orange,
      debugShowCheckedModeBanner: false,
      title: 'Project Fan',
      home: HomePage(),
      routes: {
        'HomePage': (context) => HomePage(),
        'TeamRosterPage': (context) => TeamRosterPage(),
      },
    );
  }
}
