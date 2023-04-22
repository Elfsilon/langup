import 'package:hive/hive.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';

part 'word_unit_example.g.dart';

@HiveType(typeId: HiveTypeId.wordUnitExampleTypeId)
class WordUnitExample extends HiveObject {
  WordUnitExample({
    required this.text,
    required this.translation,
  });

  @HiveField(0)
  String text;

  @HiveField(1)
  String translation;
}
