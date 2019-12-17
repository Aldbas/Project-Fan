import 'package:equatable/equatable.dart';

class PlayerGameLog {
  String gameId;
  String gameDateUTC;
  bool isHomeGame;
  Team hTeam;
  Team vTeam;
  PlayerStats playerStats;

  PlayerGameLog({
    this.gameId,
    this.gameDateUTC,
    this.isHomeGame,
    this.vTeam,
    this.hTeam,
    this.playerStats
});

  factory PlayerGameLog.fromJson(Map<String, dynamic> json) => PlayerGameLog(
    gameId: json['gameId'],
    gameDateUTC: json['gameDateUTC'],
    isHomeGame: json['isHomeGame'],
    hTeam: Team.fromJson(json['hTeam']),
    vTeam: Team.fromJson(json['vTeam']),
    playerStats: PlayerStats.fromJson(json['stats']),
  );

}

class Team {
  String teamId;
  String score;
  String triCode;
  bool isWinner;

  Team({this.score,this.teamId,this.isWinner,this.triCode});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamId: json['teamId'],
    score: json['score'],
    triCode: json['triCode'],
    isWinner: json['isWinner']
  );
}

class PlayerStats extends Equatable{
  final String personId;
  final String firstName;
  final String lastName;
  final String jersey;
  final String teamId;
  final bool isOnCourt;
  final String points;
  final String pos;
  final String positionFull;
  final String playerCode;
  final String min;
  final String fgm;
  final String fga;
  final String fgp;
  final String ftm;
  final String fta;
  final String ftp;
  final String tpm;
  final String tpa;
  final String tpp;
  final String offReb;
  final String defReb;
  final String totReb;
  final String assists;
  final String pFouls;
  final String steals;
  final String turnovers;
  final String blocks;
  final String plusMinus;
  final String dnp;

  PlayerStats (
    this.personId,
    this.firstName,
    this.lastName,
    this.jersey,
    this.teamId,
    this.isOnCourt,
    this.points,
    this.pos,
    this.positionFull,
    this.playerCode,
    this.min,
    this.fgm,
    this.fga,
    this.fgp,
    this.ftm,
    this.fta,
    this.ftp,
    this.tpm,
    this.tpa,
    this.tpp,
    this.offReb,
    this.defReb,
    this.totReb,
    this.assists,
    this.pFouls,
    this.steals,
    this.turnovers,
    this.blocks,
    this.plusMinus,
    this.dnp
);
  @override
  List<Object> get props =>[personId,firstName,lastName,teamId];

  factory PlayerStats.fromJson(Map<String, dynamic> json) => PlayerStats(
     json["personId"],
     json["firstName"],
     json["lastName"],
     json["jersey"],
     json["teamId"],
     json["isOnCourt"],
     json["points"],
     json["pos"],
     json["position_full"],
     json["player_code"],
     json["min"],
     json["fgm"],
     json["fga"],
     json["fgp"],
     json["ftm"],
     json["fta"],
     json["ftp"],
     json["tpm"],
     json["tpa"],
     json["tpp"],
     json["offReb"],
     json["defReb"],
     json["totReb"],
     json["assists"],
     json["pFouls"],
     json["steals"],
     json["turnovers"],
     json["blocks"],
     json["plusMinus"],
     json["dnp"]
  );
}