import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/word_unit_example/word_unit_example.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';
import 'package:langup/app/dictionary/data/models/word_unit_part_of_speech/word_unit_part_of_speech.dart';

part 'word_unit.g.dart';

@HiveType(typeId: HiveTypeId.wordUnitTypeId)
class WordUnit extends HiveObject {
  WordUnit({
    required this.partOfSpeech,
    required this.translations,
    this.labels,
    this.definition,
    this.synonyms,
    this.antonyms,
    this.examples,
  });

  @HiveField(0)
  WordUnitPartOfSpeech partOfSpeech;

  @HiveField(1)
  String? definition;

  @HiveField(2)
  HiveList<WordUnitLabel>? labels;

  @HiveField(3)
  List<String> translations;

  @HiveField(4)
  List<String>? synonyms;

  @HiveField(5)
  List<String>? antonyms;

  @HiveField(6)
  List<WordUnitExample>? examples;
}
