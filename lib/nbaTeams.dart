class NbaTeams {
  final bool isNBAFranchise;
  final String city;
  final String fullName;
  final String teamId;
  final String tricode;
  final String nickname;

  NbaTeams({this.isNBAFranchise, this.city, this.fullName, this.teamId, this.tricode, this.nickname});

  factory NbaTeams.fromJson(Map<String, dynamic> json) {
    return NbaTeams(
      isNBAFranchise: json['isNBAFranchise'],
      nickname: json['nickname'],
      city: json['city'],
      fullName: json['fullName'],
      teamId: json['teamId'],
      tricode: json['tricode'],
    );
  }
}