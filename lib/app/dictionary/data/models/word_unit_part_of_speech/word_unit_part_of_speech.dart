import 'package:hive/hive.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';

part 'word_unit_part_of_speech.g.dart';

@HiveType(typeId: HiveTypeId.wordUnitPartOfSpeechTypeId)
enum WordUnitPartOfSpeech {
  @HiveField(0)
  noun,

  @HiveField(1)
  verb,

  @HiveField(2)
  adverb,

  @HiveField(3)
  adjective,
}
