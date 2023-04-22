import 'package:hive/hive.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';
import 'package:langup/core/utils/id_generator.dart';

part 'word_unit_label.g.dart';

@HiveType(typeId: HiveTypeId.wordUnitLabelTypeId)
class WordUnitLabel extends HiveObject {
  WordUnitLabel({
    required this.title,
    IdGenerator idGenerator = const UuidGenerator(),
  }) : id = idGenerator.generate();

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;
}
