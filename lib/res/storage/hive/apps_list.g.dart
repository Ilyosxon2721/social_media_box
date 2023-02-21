// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppsAdapter extends TypeAdapter<Apps> {
  @override
  final int typeId = 1;

  @override
  Apps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Apps()..appsList = (fields[0] as List).cast<App>();
  }

  @override
  void write(BinaryWriter writer, Apps obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.appsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
