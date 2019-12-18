import 'package:flutter/material.dart';
import 'package:project_fan/PlayersPage.dart';
import 'package:project_fan/model/playerGameLog.dart' as prefix0;
import 'package:project_fan/nbaTeams.dart';
import 'package:project_fan/player_gamelog.dart';
import 'player_news_and_updates.dart';
import 'player_stats.dart';
import 'playerTile.dart';
import 'player_news_and_updates.dart';

class DetailsScreen extends StatelessWidget {
  final Position setPosition;
  final prefix0.PlayerStats playerDetails;
  final String nbaTeam;
  final String playerPhoto;

  DetailsScreen({Key key, @required this.setPosition, this.playerDetails, this.nbaTeam,this.playerPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
//      appBar: AppBar(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
//            color: Colors.blue[900],
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${playerDetails.firstName} ${playerDetails.lastName}',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        '${playerDetails.pos} - $nbaTeam - ${playerDetails.pos}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Owned: Supreme Team',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.network(
                      playerPhoto,
                      scale: 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 80,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Today\'s Game              Game Performance'),
                  Text('W 113-100 @SA               0/0 FG, 0/0 FT      '),
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(text: 'Updates'),
                Tab(text: 'Game log'),
                Tab(text: 'Stats'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PlayerUpdates(),
                  PlayerGameLog(),
                  PlayerStats(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
