import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/services/dictionary_service.dart';
import 'package:langup/core/utils/ui_value_state_notifier.dart';
import 'package:langup/core/utils/ui_value.dart';

final dictionarySizeNotifierProvider =
    StateNotifierProvider.autoDispose<DictionarySizeNotifier, UIValue<int>>(
  (ref) => DictionarySizeNotifier(
    initialState: const UIValue(0),
    dictionaryService: ref.watch(dictionaryServiceProvider),
  ),
);

class DictionarySizeNotifier extends UIValueStateNotifier<int> {
  DictionarySizeNotifier({
    required super.initialState,
    required this.dictionaryService,
  });

  final DictionaryService dictionaryService;

  Future<void> getDictionarySize() => action(() async {
        await dictionaryService.fetchSize();
        return dictionaryService.size;
      });
}
