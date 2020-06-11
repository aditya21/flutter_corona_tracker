// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DistrictAdapter extends TypeAdapter<District> {
  @override
  District read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return District(
      state: fields[0] as String,
      confirmed: fields[1] as int,
      lastUpdatedTime: fields[2] as DateTime,
      deltaConfirmed: fields[3] as int,
      district: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, District obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.state)
      ..writeByte(1)
      ..write(obj.confirmed)
      ..writeByte(2)
      ..write(obj.lastUpdatedTime)
      ..writeByte(3)
      ..write(obj.deltaConfirmed)
      ..writeByte(4)
      ..write(obj.district);
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;
}
