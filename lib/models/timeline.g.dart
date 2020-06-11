// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineAdapter extends TypeAdapter<Timeline> {
  @override
  Timeline read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timeline(
      dailyConfirmed: fields[0] as int,
      dailyDeceased: fields[1] as int,
      dailyRecovered: fields[2] as int,
      totalConfirmed: fields[3] as int,
      totalDeceased: fields[4] as int,
      totalRecovered: fields[5] as int,
      date: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Timeline obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.dailyConfirmed)
      ..writeByte(1)
      ..write(obj.dailyDeceased)
      ..writeByte(2)
      ..write(obj.dailyRecovered)
      ..writeByte(3)
      ..write(obj.totalConfirmed)
      ..writeByte(4)
      ..write(obj.totalDeceased)
      ..writeByte(5)
      ..write(obj.totalRecovered)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  // TODO: implement typeId
  int get typeId => 2;
}
