class NbaGames {
  String gameId;

  NbaGames({this.gameId});

  factory NbaGames.fromJson(Map<String, dynamic> json) => NbaGames(
      gameId: json['gameId']
      );
}