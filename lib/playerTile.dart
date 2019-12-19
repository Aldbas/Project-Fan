import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_fan/model/game_boxscore.dart';
import 'package:project_fan/players_profile.dart';
import 'package:project_fan/team_roster_page.dart';

import 'PlayersPage.dart';
import 'model/nba_games.dart';
import 'model/playerGameLog.dart';
import 'nbaTeams.dart';

//TODO:ADD BACKEND NUMBERS/FIGURE OUT HOW TO GET
class Position {
  final String name;
  Position({this.name});
}

List<Position> setPosition = [
  Position(name: 'PG'),
  Position(name: 'SG'),
  Position(name: 'G'),
  Position(name: 'SF'),
  Position(name: 'PF'),
  Position(name: 'F'),
  Position(name: 'C'),
  Position(name: 'C'),
  Position(name: 'Util'),
  Position(name: 'Util'),
  Position(name: 'BN'),
  Position(name: 'BN'),
  Position(name: 'BN'),
  Position(name: 'WTF')
];

class Categories {
  String cat;
  Categories({
    this.cat,
  });

  static List<Categories> getCat() {
    return <Categories>[
      Categories(cat: 'FGM/A'),
      Categories(cat: 'FG%'),
      Categories(cat: 'FTM/A'),
      Categories(cat: 'FT%'),
      Categories(cat: '3PTM'),
      Categories(cat: 'PTS'),
      Categories(cat: 'REB'),
      Categories(cat: 'AST'),
      Categories(cat: 'ST'),
      Categories(cat: 'BLK'),
      Categories(cat: 'TO'),
    ];
  }
}

class PlayerGridTile extends StatelessWidget {
  final PlayerStats playerDetails;
  final String triCode;
  final Position position;
  final String playerPhoto;
  final List<NbaTeams> nbaTeam;
  final List<NbaGames> nbaGame;
  final int index;
  final Key key;

  PlayerGridTile(
      {this.playerDetails,
      this.position,
      this.index,
      this.playerPhoto,
      this.triCode,
      this.nbaTeam,
      this.nbaGame,
      this.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var format = DateFormat('yMdd');
    var date = format.format(now);
    if (playerDetails == null) return Container();
    return
//      FutureBuilder(
//        future: getBoxScore(),
//        builder: (context, snapshot) {
//          Stats nbaGame = snapshot.data;
//          List<PlayerStats> yup = nbaGame.playerStats;
//          print('PLAYERDETAILS : ${yup.firstWhere(( you) => you.personId == playerDetails.playerId )}');
//          PlayerStats stats = yup.firstWhere(( you) => you.personId == playerDetails.playerId );
//          print(stats.personId);

//          print();
//          print(okay.basicGameData.isGameActivated);
//          List<NbaGames> nbaGames = snapshot.data;
//          print(nbaGames[0].gameId);
//          print(snapshot.data);
//          Hello okay = snapshot.data;
//          PlayerStats stats = okay.stats.playerStats.firstWhere(
//              (player) => player.personId == playerDetails.playerId);
//          print(stats.lastName);

//           Hello okay = snapshot.data;
//           print(okay.basicGameData.gameId);
//           List<PlayerGameLog> yes = snapshot.data;
//           bool homeGame = yes[0].isHomeGame;
//           bool isGameActive = true;
//           Team hTeam = yes[0].hTeam;
//           Team vTeam = yes[0].vTeam;
//           String where = homeGame? 'v' : '@';
//           int playerTeam = yes[0].vTeam.teamId  == playerDetails.teamId ? int.parse(vTeam.score) : int.parse(hTeam.score);
//           int oppTeam = yes[0].hTeam.teamId != playerDetails.teamId ? int.parse(hTeam.score): int.parse(vTeam.score);
//           String winner = playerTeam > oppTeam ? 'W' : 'L';
//           NbaTeams game = nbaTeam.firstWhere((team) => team.teamId == (!homeGame? yes[0].hTeam.teamId : yes[0].vTeam.teamId));
//           String game = nbaTeam[0].teamId == yes[0].vTeam.teamId? 'hello' : 'NOPE';
//           print(playerDetails.playerId);
        GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                    playerDetails: playerDetails,
//                                      nbaTeam: hello.fullName,
//                                      setPosition: setPosition[index],
                    playerPhoto: playerPhoto)));
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          color: Colors.white, //TODO:change card 'If already playing'
          height: 70,
          child: GridTile(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    child: Text('${position.name}'),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.transparent),
                CircleAvatar(
                  radius: 32.0,
                  backgroundColor: Colors.transparent,
                  child: Image.network(playerPhoto),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
//                        playerDetails.playerId,
                    '${playerDetails.firstName[0]}. ${playerDetails.lastName}' +
                        ' $triCode - ${playerDetails.pos}\n',
//                                 '${!isGameActive? '$playerTeam - $oppTeam': '$winner $playerTeam - $oppTeam'} $where ${game.tricode}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                )
              ],
            ),
            footer: playerDetails.dnp.isNotEmpty
                ? Center(child: buildText(playerDetails.dnp))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildText('${playerDetails.fgm}/ ${playerDetails.fga}',
                          color: Colors.red), // FGM/A
                      buildText(playerDetails.fga == '0'
                          ? '-/-'
                          : '.${playerDetails.fgp.replaceAll('.', '')}'), //FG%
                      buildText(
                          '${playerDetails.ftm}/${playerDetails.fta}'), //FTM/A
                      buildText(playerDetails.fta == '0'
                          ? '-/-'
                          : '.${playerDetails.ftp.replaceAll('.', '')}'), //FT%
                      buildText(playerDetails.tpm), //3PTM
                      buildText(playerDetails.points), //points
                      buildText(playerDetails.totReb), //total rebounds
                      buildText(playerDetails.assists), //assists
                      buildText(playerDetails.steals), //steals
                      buildText(playerDetails.blocks),
                      buildText(playerDetails.turnovers),
                    ],
                  ),
          ),
        ),
      ),
    );
//        });
  }

  Widget buildText(String text, {Color color}) {
    return Text(text, style: TextStyle(fontSize: 11.0, color: color));
  }
}
