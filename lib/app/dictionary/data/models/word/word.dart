import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/word_unit/word_unit.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';

part 'word.g.dart';

@HiveType(typeId: HiveTypeId.wordTypeId)
class Word extends HiveObject {
  Word({
    required this.id,
    required this.units,
    required this.name,
    this.points = 0,
    this.priority = 0,
    this.collectionId,
  });

  Word copyWith({
    String? name,
    List<WordUnit>? units,
    int? priority,
    int? points,
    int? Function()? collectionId,
  }) =>
      Word(
        id: id,
        name: name ?? this.name,
        units: units ?? this.units,
        points: points ?? this.points,
        priority: priority ?? this.priority,
        collectionId: collectionId != null ? collectionId() : this.collectionId,
      );

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<WordUnit> units;

  @HiveField(3, defaultValue: 0)
  int priority;

  @HiveField(4, defaultValue: 0)
  int points;

  @HiveField(5, defaultValue: null)
  int? collectionId;
}
