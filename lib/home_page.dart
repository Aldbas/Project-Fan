import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fan/model/playerInfo.dart';
import 'package:project_fan/team_roster_page.dart';

import 'PlayersPage.dart';
import 'Standings.dart';
import 'league_chat.dart';
import 'matchup_page.dart';
import 'nba_api.dart';

var bgColorBlue = Colors.blue[900];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  Future<List<PlayerInfo>> playerList;


  @override
  void initState() {
    super.initState();
    playerList = nbaApi.loadPlayerList();
  }

  int _currentIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> testOptions = [
      Standings(),
      TeamRosterPage(),
      MatchUpPage(),
      PlayersPage(playerList: playerList,),
      LeagueChatPage(),
    ];
    return Scaffold(
//      backgroundColor: bgColorBlue,
      body: testOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          backgroundColor: bgColorBlue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.bookmark),title: Text('League')),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('TEAM')),
            BottomNavigationBarItem(icon: Icon(Icons.whatshot), title: Text('Matchup')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Players')),
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('LeagueChat')),
          ]),
    );
  }
}
