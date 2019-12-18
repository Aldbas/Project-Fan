import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'package:project_fan/model/nba_games.dart';
import 'package:project_fan/model/playerGameLog.dart';
import 'package:project_fan/model/today_game_scoreboard.dart';
import 'package:project_fan/nbaTeams.dart';
import 'package:intl/intl.dart';
import 'package:project_fan/nba_api.dart';

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
  Future<List<NbaTeams>> nbaTeams;
  Future<List<PlayerDetails>> playerList;
  Future<List<NbaGames>> nbaGames;
  Future<Stats> gameBoxScore;
  Future<List<Stats>> ALLBOXSCORE;

  var now = DateTime.now();
  var format = DateFormat('yMdd');


//   Future <dynamic> playerLog;

//  _TeamRosterPageState({this.nbaTeams});
//TODO WHAT IS HAPPENING IN THIS CODE BELOW


  @override
  void initState() {
    var date = format.format(now);

    super.initState();
    selectedCategories = [];
    categories = Categories.getCat();
    playerList = nbaApi.loadPlayerList();
    nbaGames = nbaApi.getListOfGames();
    nbaTeams = nbaApi.loadNbaTeams();
//    gameBoxScore = getBoxScore();
//     playerLog = getPlayerStats();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatNormal = DateFormat('E, MMM dd');
    var date = formatNormal.format(now);

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
                        Text(
                          '$date',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'BEST LEAGUE',
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
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

                FutureBuilder(future: Future.wait([
                playerList,
                nbaTeams,
                nbaGames,
//                gameBoxScore,
              ]),
              builder: (context, snapshot) {
                var date = format.format(now);

                List<PlayerDetails> playerDetails = snapshot.data[0];
                List<NbaTeams> nbaTeam = snapshot.data[1];
                List<NbaGames> nbaGames = snapshot.data[2];
                List<PlayerStats> gameDayAllPlayers = [];

//                Stats gameBoxScore = snapshot.data[3];
//                List<PlayerStats> skodfkla = gameBoxScore.playerStats;
                List<String> rosterPlayerIds = [
                  '1628983',
                  '101108',
                  '203500',
                  '1628983',
                  '203457',
                  '1626220',
                  '203497'
                ];

                List<String> playerIDs = [];
                List<PlayerStats> playersTeam = [];
                if (!snapshot.hasData) {
                  return Container(color: Colors.red,);
                }
               Iterable<Future> futures = nbaGames.map(((key) => nbaApi.getBoxScore(date: '20191216', gameId: key.gameId)));

                return FutureBuilder(
                  future: Future.wait(futures),
//                future: nbaApi.getBoxScore(gameId: nbaGames[3].gameId),
                  builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return Text('Loading....');
                    default:
//                      List<PlayerStats> yes = okay.playerStats;
//                      gameDayAllPlayers.addAll(yes);
                      snapshot.data.forEach((stat) => gameDayAllPlayers.addAll(stat.playerStats));
                      return ListView.builder(
                          padding: EdgeInsets.all(0.0),
                          itemCount: gameDayAllPlayers.length,
                          itemBuilder: (BuildContext context, int index) {
                            NbaTeams hello = nbaTeam.firstWhere((team) => team.teamId == gameDayAllPlayers[index].teamId);
                            String playerPhoto = nbaApi.getPlayerProfilePicture(gameDayAllPlayers[index].personId);
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                            playerDetails: gameDayAllPlayers[index],
//                                      nbaTeam: hello.fullName,
//                                      setPosition: setPosition[index],
                                            playerPhoto: playerPhoto)));
                              },
                              child: PlayerGridTile(
                                index: index,
//                          position: setPosition[index],
                                playerDetails: gameDayAllPlayers[index],
                                playerPhoto: playerPhoto,
                                triCode: hello.tricode ?? '',
                                nbaTeam: nbaTeam,
                                nbaGame: nbaGames,
                              ),
                            );
                          });
                    }

                  }
                );
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
