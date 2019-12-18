import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:project_fan/player_gamelog.dart';

import 'PlayersPage.dart';
import 'model/game_boxscore.dart';
import 'model/nba_games.dart';
import 'model/today_game_scoreboard.dart';
import 'nbaTeams.dart';

class NbaApi {
  var now = DateTime.now();
  var format = DateFormat('yMdd');

  getPlayerProfilePicture(String playerId) {
    final String playerProfilePhoto =
    ('https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/$playerId.png');
    return playerProfilePhoto;
  }

  Future<List<NbaTeams>> loadNbaTeams() async {
    final response =
    await http.get('http://data.nba.net/data/10s/prod/v1/2019/teams.json');
    if (response.statusCode == 200) {
      final teamListJson = jsonDecode(response.body);
      List<NbaTeams> nbaTeams = [];
      teamListJson['league']['standard']
          .forEach((team) => nbaTeams.add(NbaTeams.fromJson(team)));
//    teamListJson['league']['standard'].forEach((team) => nbaTeams.add(value));
      nbaTeams.removeWhere((team) => !team.isNBAFranchise);
      return nbaTeams;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<NbaGames>> getListOfGames() async {
//    var date = format.format(now);

    final response = await http
//        .get('https://data.nba.net/10s/prod/v2/$date/scoreboard.json');
        .get('https://data.nba.net/10s/prod/v2/20191216/scoreboard.json');

    final Map<String, dynamic> gameListJson = jsonDecode(response.body);
    List<NbaGames> nbaGames = [];
    gameListJson['games']
        .forEach((game) => nbaGames.add(NbaGames.fromJson(game)));
    return nbaGames;
  }

  Future<List<PlayerDetails>> loadPlayerList() async {
//    final response = await http.get('https://data.nba.net/10s/prod/v1/2019/teams/thunder/roster.json');
    final response = await http
        .get('http://data.nba.net/data/10s/prod/v1/2019/players.json');
//  PlayerDetails.fromJson(json.decode(response.body));
    final Map<String, dynamic> playerListJson = jsonDecode(response.body);
//    print(playerListJson);
    List<PlayerDetails> players = [];
    playerListJson['league']['standard']
//    ['players']
        .forEach((player) => players.add(PlayerDetails.fromJson(player)));
    List<PlayerDetails> OKCPLAYERS = [];
    OKCPLAYERS = players
        .where((PlayerDetails player) => player.teamId == '1610612760')
        .toList();
//    return OKCPLAYERS;

//  players.removeWhere((player) => !player.isActive);

    return players;
  }


  playerGameLog(String playerId) async {
    final response = await http.get(
        'http://data.nba.net/data/10s/prod/v1/2019/players/${playerId}_gamelog.json');
    if (response.statusCode == 200) {
      final gameLogJson = jsonDecode(response.body);

      List<PlayerGameLog> playerLog = [];
      gameLogJson['leageue']['standard']
          .forEach((gameLog) => playerLog.add(gameLog));
//      print(playerLog);
      return playerLog;
    }
  }

  gameScoreBoard() async {
    final response = await http
        .get('https://data.nba.net/10s/prod/v2/20191216/scoreboard.json');
    if (response.statusCode == 200) {
      final testBody = jsonDecode(response.body);
      List<Game> test = [];

      testBody['games'].forEach((game) => test.add(Game.fromJson(game)));
      return test;
    } else {
      print('error');
      throw Exception('Failed to load');
    }
  }

  Future<Stats> getBoxScore({String date, String gameId}) async {
    final response = await http.get(
        'https://data.nba.net/data/10s/prod/v1/$date/${gameId}_boxscore.json');
    if (response.statusCode == 200) {
      final testBody = jsonDecode(response.body);
//      print(testBody['basicGameData']);
//      List<Hello> WTF = [];
//      testBody.forEach((game) => WTF.add(Hello.fromJson(game)));
      Stats okay = Stats.fromJson(testBody['stats']);
      return okay;
    } else {

      throw Exception('Failed to load post');
    }
  }
}
final NbaApi nbaApi = NbaApi();

