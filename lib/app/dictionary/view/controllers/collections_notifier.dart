import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/collection/collection.dart';
import 'package:langup/app/dictionary/services/collections_service.dart';
import 'package:langup/core/utils/ui_value_state_notifier.dart';
import 'package:langup/core/utils/ui_value.dart';

typedef CollectionsNotifierProvider = AutoDisposeStateNotifierProvider<
    CollectionsNotifier, UIValue<List<Collection>>>;

final collectionsNotifierProvider = CollectionsNotifierProvider(
  (ref) => CollectionsNotifier(
    initialState: const UIValue<List<Collection>>([]),
    service: ref.watch(collectionsServiceProvider),
  ),
);

class CollectionsNotifier extends UIValueStateNotifier<List<Collection>> {
  CollectionsNotifier({
    required super.initialState,
    required this.service,
  });

  final CollectionsService service;

  Future<List<Collection>> _getCollections() async {
    await service.fetchCollections();
    return service.collections;
  }

  Future<void> getCollections() => action(() async {
        return _getCollections();
      });

  Future<void> addCollection({
    required String title,
  }) =>
      action(() async {
        await service.addCollection(
          title: title,
        );
        return _getCollections();
      });

  Future<void> editCollection({
    required String id,
    String? title,
  }) =>
      action(() async {
        await service.updateCollection(
          id: id,
          title: title,
        );
        return _getCollections();
      });

  Future<void> deleteCollection(String id) => action(() async {
        await service.deleteCollection(id);
        return _getCollections();
      });
}
