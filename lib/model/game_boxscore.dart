
import 'dart:convert';

import 'package:project_fan/model/playerGameLog.dart';

class Hello {
  BasicGameData basicGameData;
  Stats stats;

  Hello({
    this.basicGameData,
    this.stats,
  });

  factory Hello.fromJson(Map<String, dynamic> json) => Hello(
    basicGameData: BasicGameData.fromJson(json["basicGameData"]),
    stats: Stats.fromJson(json["stats"]),
  );
}

class BasicGameData {
  String gameId;
  bool isGameActivated;
  String startTimeEastern;
  int statusNum;
  GameTeamData vTeam;
  GameTeamData hTeam;

  BasicGameData({
    this.gameId,
    this.isGameActivated,
    this.startTimeEastern,
    this.vTeam,
    this.hTeam,
    this.statusNum
  });

  factory BasicGameData.fromJson(Map<String, dynamic> json) => BasicGameData(
    gameId: json["gameId"],
    isGameActivated: json["isGameActivated"],
    startTimeEastern: json["startTimeEastern"],
    vTeam: GameTeamData.fromJson(json["vTeam"]),
    hTeam: GameTeamData.fromJson(json["hTeam"]),
    statusNum: json['statusNum']
  );
}




class GameTeamData {
  String teamId;
  String triCode;
  String score;

  GameTeamData({
    this.teamId,
    this.triCode,
    this.score,
  });

  factory GameTeamData.fromJson(Map<String, dynamic> json) => GameTeamData(
    teamId: json["teamId"],
    triCode: json["triCode"],
    score: json["score"],
  );
}


class Quarter {
  int current;
  int type;
  int maxRegular;
  bool isHalftime;
  bool isEndOfQuarter;

  Quarter({
    this.current,
    this.type,
    this.maxRegular,
    this.isHalftime,
    this.isEndOfQuarter,
  });

  factory Quarter.fromJson(Map<String, dynamic> json) => Quarter(
    current: json["current"],
    type: json["type"],
    maxRegular: json["maxRegular"],
    isHalftime: json["isHalftime"],
    isEndOfQuarter: json["isEndOfPeriod"],
  );
}



class Stats {
  List<PlayerStats> playerStats;
  Stats({this.playerStats});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    playerStats: List<PlayerStats>.from(json["activePlayers"].map((x) => PlayerStats.fromJson(x))),
  );
}

