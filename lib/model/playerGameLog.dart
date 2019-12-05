class PlayerGameLog {
  String gameId;
  String gameDateUTC;
  bool isHomeGame;
  Team hTeam;
  Team vTeam;
  Stats stats;

  PlayerGameLog({
    this.gameId,
    this.gameDateUTC,
    this.isHomeGame,
    this.vTeam,
    this.hTeam,
    this.stats
});

  factory PlayerGameLog.fromJson(Map<String, dynamic> json) => PlayerGameLog(
    gameId: json['gameId'],
    gameDateUTC: json['gameDateUTC'],
    isHomeGame: json['isHomeGame'],
    hTeam: Team.fromJson(json['hTeam']),
    vTeam: Team.fromJson(json['vTeam']),
    stats: Stats.fromJson(json['stats']),
  );

}

class Team {
  String teamId;
  String score;
  bool isWinner;

  Team({this.score,this.teamId,this.isWinner});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamId: json['teamId'],
    score: json['score'],
    isWinner: json['isWinner']
  );
}

class Stats {
  String personId;
  String firstName;
  String lastName;
  String jersey;
  String teamId;
  bool isOnCourt;
  String points;
  String pos;
  String positionFull;
  String playerCode;
  String min;
  String fgm;
  String fga;
  String fgp;
  String ftm;
  String fta;
  String ftp;
  String tpm;
  String tpa;
  String tpp;
  String offReb;
  String defReb;
  String totReb;
  String assists;
  String pFouls;
  String steals;
  String turnovers;
  String blocks;
  String plusMinus;

  Stats ({
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
});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
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
  );
}