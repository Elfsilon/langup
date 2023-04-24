import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/services/dictionary_service.dart';
import 'package:langup/core/utils/ui_value_state_notifier.dart';
import 'package:langup/core/utils/ui_value.dart';

final dictionaryNotifierProvider =
    StateNotifierProvider.autoDispose<DetailWordNotifier, UIValue<Word?>>(
  (ref) => DetailWordNotifier(
    initialState: const UIValue<Word?>(null),
    dictionaryService: ref.watch(dictionaryServiceProvider),
  ),
);

class DetailWordNotifier extends UIValueStateNotifier<Word?> {
  DetailWordNotifier({
    required super.initialState,
    required this.dictionaryService,
  });

  final DictionaryService dictionaryService;

  Future<void> getDictionarySize(String id) => action(() async {
        await dictionaryService.fetchWordById(id);
        return dictionaryService.wordById;
      });
}
