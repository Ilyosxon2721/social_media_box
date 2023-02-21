// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppAdapter extends TypeAdapter<App> {
  @override
  final int typeId = 2;

  @override
  App read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return App(
      id: fields[0] as int,
      icon: fields[1] as String,
      title: fields[2] as String,
      route: fields[3] as String,
      link: fields[4] as String,
      isLock: fields[5] as bool,
      isPopular: fields[6] as bool,
      isSocial: fields[7] as bool,
      isMedia: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, App obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.route)
      ..writeByte(4)
      ..write(obj.link)
      ..writeByte(5)
      ..write(obj.isLock)
      ..writeByte(6)
      ..write(obj.isPopular)
      ..writeByte(7)
      ..write(obj.isSocial)
      ..writeByte(8)
      ..write(obj.isMedia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
