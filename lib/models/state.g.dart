// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatesAdapter extends TypeAdapter<States> {
  @override
  States read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return States(
      active: fields[0] as int,
      confirmed: fields[1] as int,
      dead: fields[2] as int,
      recovered: fields[3] as int,
      deltaConfirmed: fields[4] as int,
      deltaRecovered: fields[5] as int,
      deltaDeaths: fields[6] as int,
      lastUpdatedTime: fields[7] as DateTime,
      state: fields[8] as String,
      stateCode: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, States obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.active)
      ..writeByte(1)
      ..write(obj.confirmed)
      ..writeByte(2)
      ..write(obj.dead)
      ..writeByte(3)
      ..write(obj.recovered)
      ..writeByte(4)
      ..write(obj.deltaConfirmed)
      ..writeByte(5)
      ..write(obj.deltaRecovered)
      ..writeByte(6)
      ..write(obj.deltaDeaths)
      ..writeByte(7)
      ..write(obj.lastUpdatedTime)
      ..writeByte(8)
      ..write(obj.state)
      ..writeByte(9)
      ..write(obj.stateCode);
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;
}
