// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingModelAdapter extends TypeAdapter<SettingModel> {
  @override
  SettingModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingModel(
      fields[0] as bool,
      fields[1] as bool,
      fields[2] as String,
      fields[3] as String,
      fields[5] as int,
    )..target = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, SettingModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.acceptNoti)
      ..writeByte(1)
      ..write(obj.acceptNotiWhenComplete)
      ..writeByte(2)
      ..write(obj.timeWakeup)
      ..writeByte(3)
      ..write(obj.timeSleep)
      ..writeByte(4)
      ..write(obj.target)
      ..writeByte(5)
      ..write(obj.mlInDay);
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;
}
