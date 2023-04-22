// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_unit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordUnitAdapter extends TypeAdapter<WordUnit> {
  @override
  final int typeId = 2;

  @override
  WordUnit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordUnit(
      partOfSpeech: fields[0] as WordUnitPartOfSpeech,
      translations: (fields[3] as List).cast<String>(),
      labels: (fields[2] as HiveList?)?.castHiveList(),
      definition: fields[1] as String?,
      synonyms: (fields[4] as List?)?.cast<String>(),
      antonyms: (fields[5] as List?)?.cast<String>(),
      examples: (fields[6] as List?)?.cast<WordUnitExample>(),
    );
  }

  @override
  void write(BinaryWriter writer, WordUnit obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.partOfSpeech)
      ..writeByte(1)
      ..write(obj.definition)
      ..writeByte(2)
      ..write(obj.labels)
      ..writeByte(3)
      ..write(obj.translations)
      ..writeByte(4)
      ..write(obj.synonyms)
      ..writeByte(5)
      ..write(obj.antonyms)
      ..writeByte(6)
      ..write(obj.examples);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
