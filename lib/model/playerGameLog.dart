import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'playerGameLog.g.dart';

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
@HiveType(typeId: 2)
class PlayerStats extends Equatable{
  @HiveField(0)
  final String personId;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String jersey;
  @HiveField(4)
  final String teamId;
  final bool isOnCourt;
  final String points;
  final String pos;
  final String positionFull;
  @HiveField(5)
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

  PlayerStats ({
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
  });
  @override
  List<Object> get props =>[personId,firstName,lastName,teamId];

  factory PlayerStats.fromJson(Map<String, dynamic> json) => PlayerStats(
     personId: json["personId"],
     firstName: json["firstName"],
     lastName: json["lastName"],
     jersey: json["jersey"],
     teamId: json["teamId"],
     isOnCourt: json["isOnCourt"],
     points: json["points"],
     pos: json["pos"],
     positionFull: json["position_full"],
     playerCode: json["player_code"],
     min: json["min"],
     fgm: json["fgm"],
     fga: json["fga"],
     fgp: json["fgp"],
     ftm: json["ftm"],
     fta: json["fta"],
     ftp: json["ftp"],
     tpm: json["tpm"],
     tpa: json["tpa"],
     tpp: json["tpp"],
     offReb: json["offReb"],
     defReb: json["defReb"],
     totReb: json["totReb"],
     assists: json["assists"],
     pFouls: json["pFouls"],
     steals: json["steals"],
     turnovers: json["turnovers"],
     blocks: json["blocks"],
     plusMinus: json["plusMinus"],
     dnp: json["dnp"]
  );
}