// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_unit_example.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordUnitExampleAdapter extends TypeAdapter<WordUnitExample> {
  @override
  final int typeId = 5;

  @override
  WordUnitExample read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordUnitExample(
      text: fields[0] as String,
      translation: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WordUnitExample obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.translation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordUnitExampleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
