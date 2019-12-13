import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'package:project_fan/model/nba_games.dart';
import 'package:project_fan/model/playerGameLog.dart';
import 'package:project_fan/model/today_game_scoreboard.dart';
import 'package:project_fan/nbaTeams.dart';
import 'package:intl/intl.dart';

import 'PlayersPage.dart';
import 'home_page.dart';
import 'model/game_boxscore.dart';
import 'players_profile.dart';
import 'playerTile.dart';

import 'dart:math' as math;

//TODO: CLEAN UP CODE
//TODO:FIND WAY TO GET PLAYER STATS
//TODO:CREATE A WAY TO SHOW 'PLAYED ALREADY'
//TODO:Create player page when tapped
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

List<String> testCat = [
  'FGM/A',
  'FG%',
  'FTM/A',
  'FT%',
  '3PTM',
  'PTS',
  'REB',
  'STL',
  'AST',
  'BLK',
  'TO',
];
List<Categories> categories;
List<Categories> selectedCategories;

//  bool sort;
class TeamRosterPage extends StatefulWidget {
  @override
  _TeamRosterPageState createState() => _TeamRosterPageState();
}

class _TeamRosterPageState extends State<TeamRosterPage> {
   Future <List<NbaTeams>> nbaTeams;
   Future <List<PlayerStats>> playerList;
   Future <List<NbaGames>> nbaGames;
   Future<Stats> gameBoxScore;


   var now = DateTime.now();
   var format = DateFormat('yMdd');

//   Future <dynamic> playerLog;

//  _TeamRosterPageState({this.nbaTeams});
//TODO WHAT IS HAPPENING IN THIS CODE BELOW
  
  Future<List<NbaGames>>getListOfGames() async {
    var date = format.format(now);

    final response = await http.get('https://data.nba.net/10s/prod/v2/$date/scoreboard.json');
    final Map<String, dynamic> gameListJson = jsonDecode(response.body);
    List<NbaGames> nbaGames = [];
    gameListJson['games'].forEach((game) => nbaGames.add(NbaGames.fromJson(game)));
    return nbaGames;
  }

  Future<List<PlayerStats>> loadPlayerList() async {
//    final response = await http.get('https://data.nba.net/10s/prod/v1/2019/teams/thunder/roster.json');
    final response = await http.get('http://data.nba.net/data/10s/prod/v1/2019/players.json');
//  PlayerDetails.fromJson(json.decode(response.body));
    final Map<String, dynamic> playerListJson = jsonDecode(response.body);
//    print(playerListJson);
    List<PlayerStats> players = [];
    playerListJson['league']['standard']
//    ['players']
        .forEach((player) => players.add(PlayerStats.fromJson(player)));
    List<PlayerStats> OKCPLAYERS = [];
    OKCPLAYERS = players.where((PlayerStats player) => player.teamId == '1610612760').toList();
      return OKCPLAYERS;

//  players.removeWhere((player) => !player.isActive);

    return players;
  }

  getPlayerProfilePicture(String playerId) {
    final String playerProfilePhoto =
    ('https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/$playerId.png');
    return playerProfilePhoto;
  }

  Future<List<NbaTeams>> loadNbaTeams() async {
    final response = await http.get('http://data.nba.net/data/10s/prod/v1/2019/teams.json');
    if(response.statusCode == 200) {
      final teamListJson = jsonDecode(response.body);
      List<NbaTeams> nbaTeams= [];
      teamListJson['league']['standard'].forEach((team) => nbaTeams.add(NbaTeams.fromJson(team)));
//    teamListJson['league']['standard'].forEach((team) => nbaTeams.add(value));
      nbaTeams.removeWhere((team) => !team.isNBAFranchise);
      return nbaTeams;
    }else {
      throw Exception('Failed to load');
    }
  }
  
  playerGameLog(String playerId) async {
    final response = await http.get('http://data.nba.net/data/10s/prod/v1/2019/players/${playerId}_gamelog.json');
    if(response.statusCode == 200) {
      final gameLogJson = jsonDecode(response.body);

      List<PlayerGameLog> playerLog = [];
      gameLogJson['leageue']['standard'].forEach((gameLog) => playerLog.add(gameLog));
//      print(playerLog);
      return playerLog;
    }
  }

  gameScoreBoard() async {
    final response = await http.get('https://data.nba.net/10s/prod/v2/20191202/scoreboard.json');
    if(response.statusCode == 200) {
      final testBody = jsonDecode(response.body);
      List<Game> test = [];

      testBody['games'].forEach((game) => test.add(Game.fromJson(game)));
      return test;
    }else {
      print('error');
      throw Exception('Failed to load');
    }
  }
  Future<Stats> getBoxScore({String date, String gameId}) async {
//    String gameId = nbaGame[0].gameId;
//    https://data.nba.net/data/10s/prod/v1/20191205/0021900316_boxscore.json
//    https://data.nba.net/data/10s/prod/v1/$date/${gameId}_boxscore.json
    final response = await http.get('https://data.nba.net/data/10s/prod/v1/20191209/0021900350_boxscore.json');
    if (response.statusCode == 200) {
      final testBody = jsonDecode(response.body);
//      print(testBody['basicGameData']);
//      List<Hello> WTF = [];
//      testBody.forEach((game) => WTF.add(Hello.fromJson(game)));
      Stats okay = Stats.fromJson(testBody['stats']);
      return okay;
    }else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState()  {
    super.initState();
    selectedCategories = [];
    categories = Categories.getCat();
    playerList = loadPlayerList();
    nbaGames = getListOfGames();
    nbaTeams = loadNbaTeams();
    gameBoxScore = getBoxScore();
//     playerLog = getPlayerStats();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var format = DateFormat('E, MMM dd');
    var date = format.format(now);

    List<Widget> widgets = testCat
        .map((testCat) => Text(testCat,
            style: TextStyle(fontSize: 11.0, color: Colors.indigo)))
        .toList();
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: bgColorBlue,
                  expandedHeight: 150,
                  pinned: true,
//                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       Text('$date',style: TextStyle(color: Colors.white),),
                        Text(
                          'BEST LEAGUE',
                          style: TextStyle(color: Colors.white),
                        ),IconButton(
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                          onPressed: () => print('Team Settings'))
                      ],
                    ),
                    centerTitle: true,
                    title: Text('TEAM NAME'),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70,
                    maxHeight: 70,
                    child: Container(
                      height: 70,
                      color: Colors.blue[900],
                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Players',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: categories
                                .map((categories) => Text(
                                      categories.cat,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,

//                                    fontWeight: FontWeight.bold
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body:
//
            FutureBuilder(
//              future: gameScoreBoard(),
//                builder: (BuildContext context, AsyncSnapshot snapshot) {
//                List<Game> game = snapshot.data;
//                print(game[0].gameId);
//                print(game[0].startDateEastern);
//                return Container(color: Colors.white,
//                    child:Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
//                        Text(game[1].vTeam.triCode),
//                        Text(game[1].hTeam.triCode),
//                        Text(game[1].hTeam.score),
//                        Text(game[1].vTeam.score)
//                      ],
//                    ));
//                },
             future: Future.wait([
               playerList,
               nbaTeams,
               nbaGames,
               gameBoxScore,

             ]),
              builder: (context, snapshot) {
                List <PlayerStats> playerDetails = snapshot.data[0];
                List <NbaTeams> nbaTeam = snapshot.data[1];
                List <NbaGames> nbaGame = snapshot.data[2];
                Stats gameBoxScore = snapshot.data[3];
                List <PlayerStats> skodfkla = gameBoxScore.playerStats;
                List<String> rosterPlayerIds= [ '1628983','101108', '203500', '1628983','203457', '1626220', '203497'];
                List<String> playerIDs = [];
                List<PlayerStats> playersTeam = [];
               if(!snapshot.hasData) {
                 return Container();
               }
                return ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
//                      playerIDs.add(playerDetails)
//                      playersTeam.add(skodfkla.singleWhere((player) => player.personId == rosterPlayerIds[index])); // works
//                      playersTeam.add(skodfkla.firstWhere((player) => player.personId == gameBoxScore.playerStats[index].personId)); // works
                        playersTeam.add(gameBoxScore.playerStats.firstWhere((player) => player.personId == playerDetails[index].personId, orElse: () => null));
                      print(playersTeam.length);

                      NbaTeams hello = nbaTeam.firstWhere((team) => team.teamId == playerDetails[index].teamId);
                      String playerPhoto = getPlayerProfilePicture(skodfkla[index].personId);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
//                                      playerDetails: PlayerDetails[index],
//                                      nbaTeam: hello.fullName,
//                                      setPosition: setPosition[index],
                                      playerPhoto: playerPhoto)));
                        },
                        child: PlayerGridTile(
                          index: index,
//                          position: setPosition[index],
                          playerDetails: playersTeam[index],
                          playerPhoto: playerPhoto,
                          triCode: hello.tricode?? '',
                          nbaTeam: nbaTeam,
                          nbaGame: nbaGame,
                        ),
                      );
                    });
              },
            )),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
//        maxHeight != oldDelegate.maxHeight ||
//            minHeight != oldDelegate.minHeight ||
//            child != oldDelegate.child;
  }
}
