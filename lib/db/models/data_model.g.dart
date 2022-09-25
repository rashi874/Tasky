// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategorymodelAdapter extends TypeAdapter<TaskCategorymodel> {
  @override
  final int typeId = 1;

  @override
  TaskCategorymodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskCategorymodel(
      title: fields[1] as String,
      description: fields[2] as String,
      sub: fields[3] as String,
      icon: fields[4] as int,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, TaskCategorymodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.sub)
      ..writeByte(4)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategorymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
