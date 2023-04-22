import 'package:hive/hive.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';
import 'package:langup/core/utils/id_generator.dart';

part 'collection.g.dart';

@HiveType(typeId: HiveTypeId.collection)
class Collection extends HiveObject {
  Collection({
    required this.title,
    IdGenerator idGenerator = const UuidGenerator(),
  }) : id = idGenerator.generate();

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;
}
