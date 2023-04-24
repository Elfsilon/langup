import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/models/word_unit/word_unit.dart';
import 'package:langup/app/dictionary/services/dictionary_service.dart';
import 'package:langup/core/utils/ui_value_state_notifier.dart';
import 'package:langup/core/utils/ui_value.dart';

typedef DictionaryNotifierProvider
    = AutoDisposeStateNotifierProvider<DictionaryNotifier, UIValue<List<Word>>>;

final dictionaryNotifierProvider = DictionaryNotifierProvider(
  (ref) => DictionaryNotifier(
    initialState: const UIValue<List<Word>>([]),
    dictionaryService: ref.watch(dictionaryServiceProvider),
  ),
);

class DictionaryNotifier extends UIValueStateNotifier<List<Word>> {
  DictionaryNotifier({
    required super.initialState,
    required this.dictionaryService,
  });

  final DictionaryService dictionaryService;

  Future<List<Word>> _getDictionary() async {
    await dictionaryService.fetchWords();
    return dictionaryService.words;
  }

  Future<void> getDictionary() => action(() async {
        return _getDictionary();
      });

  Future<void> addWord({
    required String name,
    required List<WordUnit> units,
    int priority = 0,
    int points = 0,
    int? collectionId,
  }) =>
      action(() async {
        await dictionaryService.addWord(
          name: name,
          units: units,
          collectionId: collectionId,
          points: points,
          priority: priority,
        );
        return _getDictionary();
      });

  Future<void> editWord({
    required String id,
    String? name,
    List<WordUnit>? units,
    int? priority,
    int? points,
    int? collectionId,
  }) =>
      action(() async {
        await dictionaryService.updateWord(
          id: id,
          name: name,
          units: units,
          points: points,
          priority: priority,
          collectionId: collectionId != null ? () => collectionId : () => null,
        );
        return _getDictionary();
      });

  Future<void> deleteWord(String id) => action(() async {
        await dictionaryService.deleteWord(id);
        return _getDictionary();
      });
}
