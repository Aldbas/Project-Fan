// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerInfoAdapter extends TypeAdapter<PlayerInfo> {
  @override
  final typeId = 0;

  @override
  PlayerInfo read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerInfo(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      personId: fields[2] as String,
      teamId: fields[3] as String,
      jersey: fields[4] as String,
      pos: fields[5] as String,
      isActive: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.personId)
      ..writeByte(3)
      ..write(obj.teamId)
      ..writeByte(4)
      ..write(obj.jersey)
      ..writeByte(5)
      ..write(obj.pos)
      ..writeByte(6)
      ..write(obj.isActive);
  }
}
