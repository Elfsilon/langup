// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_unit_part_of_speech.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordUnitPartOfSpeechAdapter extends TypeAdapter<WordUnitPartOfSpeech> {
  @override
  final int typeId = 3;

  @override
  WordUnitPartOfSpeech read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WordUnitPartOfSpeech.noun;
      case 1:
        return WordUnitPartOfSpeech.verb;
      case 2:
        return WordUnitPartOfSpeech.adverb;
      case 3:
        return WordUnitPartOfSpeech.adjective;
      default:
        return WordUnitPartOfSpeech.noun;
    }
  }

  @override
  void write(BinaryWriter writer, WordUnitPartOfSpeech obj) {
    switch (obj) {
      case WordUnitPartOfSpeech.noun:
        writer.writeByte(0);
        break;
      case WordUnitPartOfSpeech.verb:
        writer.writeByte(1);
        break;
      case WordUnitPartOfSpeech.adverb:
        writer.writeByte(2);
        break;
      case WordUnitPartOfSpeech.adjective:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordUnitPartOfSpeechAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
