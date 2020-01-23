import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part'playerInfo.g.dart';

@HiveType(typeId: 0)
class PlayerInfo extends Equatable with HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String personId;
  @HiveField(3)
  final String teamId;
  @HiveField(4)
  final String jersey;
  @HiveField(5)
  final String pos;
  @HiveField(6)
  final bool isActive;

  PlayerInfo({
   this.firstName,
   this.lastName,
   this.personId,
   this.teamId,
   this.jersey,
   this.pos,
   this.isActive
});
  @override
  List<Object> get props => [
    firstName,
    lastName,
    personId,
    teamId,
    jersey,
    pos];

  factory PlayerInfo.fromJson(Map<String, dynamic> json) => PlayerInfo(
    firstName: json['firstName'],
    lastName: json['lastName'],
    personId: json['personId'],
    teamId: json['teamId'],
    jersey: json['jersey'],
    pos: json['pos'],
    isActive: json['isActive'],
  );
}