import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/collection/collection.dart';
import 'package:langup/app/dictionary/data/repositories/collections_repository/collections_repository.dart';

class CollectionsRepositoryHive implements CollectionsRepository {
  const CollectionsRepositoryHive({
    required this.box,
  });

  final Box<Collection> box;

  @override
  Future<List<Collection>> getCollections() async {
    return box.values.toList();
  }

  @override
  Future<Collection?> getCollectionById(String id) async {
    return box.get(id);
  }

  @override
  Future<void> addCollection(Collection collection) async {
    await box.put(collection.id, collection);
  }

  @override
  Future<void> updateCollection(Collection updatedCollection) async {
    if (box.containsKey(updatedCollection.id)) {
      box.put(updatedCollection.id, updatedCollection);
    } else {
      throw Exception(
          "[HiveDictionaryRepository] Collection with provided id not found");
    }
  }

  @override
  Future<void> deleteCollection(String id) async {
    await box.delete(id);
  }
}
