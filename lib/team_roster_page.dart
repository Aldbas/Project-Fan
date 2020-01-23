import 'package:flutter/material.dart';
import 'package:project_fan/UI/date_picker.dart';
import 'package:project_fan/model/nba_games.dart';
import 'package:project_fan/model/playerGameLog.dart';
import 'package:project_fan/model/playerInfo.dart';
import 'package:project_fan/nbaTeams.dart';
import 'package:intl/intl.dart';
import 'package:project_fan/nba_api.dart';

import 'PlayersPage.dart';
import 'home_page.dart';
import 'model/game_boxscore.dart';
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

List<Categories> categories;
List<Categories> selectedCategories;

//  bool sort;
class TeamRosterPage extends StatefulWidget {
  @override
  _TeamRosterPageState createState() => _TeamRosterPageState();
}

class _TeamRosterPageState extends State<TeamRosterPage> {
  Future<List<NbaTeams>> nbaTeams;
  Future<List<PlayerInfo>> playerList;
  Future<List<NbaGames>> nbaGames;
  Future<Stats> gameBoxScore;
  List<Widget> _columns;

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

    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: bgColorBlue,
                expandedHeight: 130,
                pinned: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      onPressed: () => print('Team Settings'))
                ],
                title: Text('BEST LEAGUE'),
                  centerTitle: true,
//                  floating: false,
                flexibleSpace: FlexibleSpaceBar(

//                  title: Text('HELLO'),
                  centerTitle: true,


                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DatePicker(),
                          MaterialButton(child: Text('Stats: Today',style: TextStyle(color: Colors.white)),
                          onPressed: () => print('drop down options')) // dropdown
                        ],
                      ),
                    ],
                  ),
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
                          style: TextStyle(color: Colors.white, fontSize: 15.0)),
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
          body: FutureBuilder(
            future: Future.wait([
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
                return Container(
                  color: Colors.red,
                );
              }
              Iterable<Future<Hello>> futures = nbaGames.map(((key) => nbaApi.getBoxScore(date: '20191218', gameId: key.gameId)));
              return FutureBuilder(
                  future: Future.wait(futures),
//                future: nbaApi.getBoxScore(gameId: nbaGames[3].gameId),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text('Loading....');
                      default:
                        List<Hello> yes = snapshot.data;
//                        print(yes.where((game) => game.basicGameData.statusNum > 1));
//                       Hello yes = snapshot.data;
                       bool gameStartCheck = snapshot.data.forEach((Hello game) {
                         if(game.basicGameData.statusNum > 1 ) {

//                           print('${game.basicGameData.gameId}');
                         }
                       } );


//                      List<PlayerStats> yes = okay.playerStats;
//                      gameDayAllPlayers.addAll(yes);
//                        yes.where((game) => game.stats != null);
                        snapshot.data.forEach((game) => gameDayAllPlayers.addAll(game.stats.playerStats));
//                        yes.stats.playerStats.forEach((player) => gameDayAllPlayers.add(player));
                        return ListView.builder(
                            padding: EdgeInsets.all(0.0),
                            itemCount: gameDayAllPlayers.length,
                            itemBuilder: (BuildContext context, int index) {

                              NbaTeams hello = nbaTeam.firstWhere((team) => team.teamId == gameDayAllPlayers[index].teamId);
                              String playerPhoto = nbaApi.getPlayerProfilePicture(gameDayAllPlayers[index].personId);
//                              gameDayAllPlayers[index].

                              return Opacity(
                                opacity:  1.0,
                                child: PlayerGridTile(
                                  position: setPosition[index],
                                  playerDetails: gameDayAllPlayers[index],
                                  playerPhoto: playerPhoto,
                                  triCode: hello.tricode ?? '',
                                  nbaTeam: nbaTeam,
                                  nbaGame: nbaGames,
                                ),
                              );
                            });
                    }
                  });
            },
          )),
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
