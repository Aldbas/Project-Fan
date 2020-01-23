// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerGameLog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerStatsAdapter extends TypeAdapter<PlayerStats> {
  @override
  final typeId = 2;

  @override
  PlayerStats read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerStats(
      personId: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      jersey: fields[3] as String,
      teamId: fields[4] as String,
      playerCode: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerStats obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.personId)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.jersey)
      ..writeByte(4)
      ..write(obj.teamId)
      ..writeByte(5)
      ..write(obj.playerCode);
  }
}
