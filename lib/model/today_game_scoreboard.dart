// To parse this JSON data, do
//
//     final nba = nbaFromJson(jsonString);

import 'dart:convert';


class Game {
  String gameId;
  bool isGameActivated;
  String startTimeEastern;
  String startDateEastern;
  String clock;
  Period period;
  Team vTeam;
  Team hTeam;

  Game({
    this.gameId,
    this.isGameActivated,
    this.startTimeEastern,
    this.startDateEastern,
    this.clock,
    this.period,
    this.vTeam,
    this.hTeam,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    gameId: json["gameId"],
    isGameActivated: json["isGameActivated"],
    startTimeEastern: json["startTimeEastern"],
    startDateEastern: json["startDateEastern"],
    clock: json["clock"],
    period: Period.fromJson(json["period"]),
    vTeam: Team.fromJson(json["vTeam"]),
    hTeam: Team.fromJson(json["hTeam"]),
  );

  Map<String, dynamic> toJson() => {
    "gameId": gameId,
    "isGameActivated": isGameActivated,
    "startTimeEastern": startTimeEastern,
    "startDateEastern": startDateEastern,
    "clock": clock,
    "period": period.toJson(),
    "vTeam": vTeam.toJson(),
    "hTeam": hTeam.toJson(),
  };
}

class Team {
  String teamId;
  String triCode;
  String win;
  String loss;
  String score;

  Team({
    this.teamId,
    this.triCode,
    this.win,
    this.loss,
    this.score,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamId: json["teamId"],
    triCode: json["triCode"],
    win: json["win"],
    loss: json["loss"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamId,
    "triCode": triCode,
    "win": win,
    "loss": loss,
    "score": score,
  };
}

class Period {
  int current;
  int type;
  int maxRegular;
  bool isHalftime;
  bool isEndOfPeriod;

  Period({
    this.current,
    this.type,
    this.maxRegular,
    this.isHalftime,
    this.isEndOfPeriod,
  });

  factory Period.fromJson(Map<String, dynamic> json) => Period(
    current: json["current"],
    type: json["type"],
    maxRegular: json["maxRegular"],
    isHalftime: json["isHalftime"],
    isEndOfPeriod: json["isEndOfPeriod"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "type": type,
    "maxRegular": maxRegular,
    "isHalftime": isHalftime,
    "isEndOfPeriod": isEndOfPeriod,
  };
}

