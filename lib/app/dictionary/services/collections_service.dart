import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/collection/collection.dart';
import 'package:langup/app/dictionary/data/repositories/collections_repository/collections_repository.dart';
import 'package:langup/core/utils/exceptions.dart';
import 'package:langup/core/utils/id_generator.dart';

final collectionsServiceProvider = Provider<CollectionsService>(
  (ref) => CollectionsService(
    repository: ref.watch(collectionsRepositoryProvider),
  ),
);

class CollectionsService {
  CollectionsService({
    required CollectionsRepository repository,
    IdGenerator idGenerator = const UuidGenerator(),
  })  : _idGenerator = idGenerator,
        _repository = repository;

  final CollectionsRepository _repository;
  final IdGenerator _idGenerator;

  UnmodifiableListView<Collection> get collections =>
      UnmodifiableListView(_cachedCollections);
  List<Collection> _cachedCollections = const [];

  Future<void> fetchCollections() async {
    final items = await _repository.getCollections();
    _cachedCollections = items;
  }

  Collection? get collectionsById => _cachedCollectionById;
  Collection? _cachedCollectionById;

  Future<void> fetchWordById(String id) async {
    final item = await _repository.getCollectionById(id);
    _cachedCollectionById = item;
  }

  Future<void> addCollection({
    required String title,
  }) async {
    final collection = Collection(
      id: _idGenerator.generate(),
      title: title,
    );
    await _repository.addCollection(collection);
  }

  Future<void> updateCollection({
    required String id,
    String? title,
  }) async {
    final collectionToUpdate = await _repository.getCollectionById(id);
    if (collectionToUpdate == null) {
      throw const AppException(
          "No such word in dictionary. (collectionToUpdate == null)",
          "updateCollection");
    }

    final updatedCollection = collectionToUpdate.copyWith(
      title: title,
    );
    await _repository.updateCollection(updatedCollection);
  }

  Future<void> deleteCollection(String id) async {
    await _repository.deleteCollection(id);
  }
}
