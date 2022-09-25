// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskmodelAdapter extends TypeAdapter<Taskmodel> {
  @override
  final int typeId = 3;

  @override
  Taskmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Taskmodel(
      title: fields[1] as String,
      date: fields[2] as DateTime,
      descriptionvocab: fields[3] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Taskmodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.descriptionvocab);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
