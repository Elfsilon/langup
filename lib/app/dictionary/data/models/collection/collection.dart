import 'package:hive/hive.dart';
import 'package:langup/core/utils/hive/hive_type_id.dart';

part 'collection.g.dart';

@HiveType(typeId: HiveTypeId.collection)
class Collection extends HiveObject {
  Collection({
    required this.id,
    required this.title,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;
}
