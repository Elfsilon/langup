// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_unit_label.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordUnitLabelAdapter extends TypeAdapter<WordUnitLabel> {
  @override
  final int typeId = 4;

  @override
  WordUnitLabel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordUnitLabel(
      title: fields[1] as String,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, WordUnitLabel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordUnitLabelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
