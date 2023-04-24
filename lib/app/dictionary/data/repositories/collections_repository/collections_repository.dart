import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/collection/collection.dart';
import 'package:langup/app/dictionary/data/repositories/collections_repository/collections_repository_hive.dart';
import 'package:langup/core/utils/hive/hive_utils.dart';

final collectionsRepositoryProvider = Provider<CollectionsRepository>(
  (ref) => CollectionsRepositoryHive(
    box: HiveUtils.collectionsBox(),
  ),
);

abstract class CollectionsRepository {
  Future<List<Collection>> getCollections();
  Future<Collection?> getCollectionById(String id);
  Future<void> addCollection(Collection word);
  Future<void> updateCollection(Collection updatedWord);
  Future<void> deleteCollection(String id);
}
