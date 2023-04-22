import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/services/dictionary_service.dart';
import 'package:langup/core/utils/ui_value.dart';

final dictionaryScreenProvider = StateNotifierProvider.autoDispose<
    DictionaryScreenController, UIValue<List<Word>>>(
  (ref) => DictionaryScreenController(
    service: ref.watch(dictionaryServiceProvider),
  ),
);

class DictionaryScreenController extends StateNotifier<UIValue<List<Word>>> {
  DictionaryScreenController({
    required this.service,
  }) : super(UIValue(service.words));

  final DictionaryService service;

  void getDictionary() async {
    try {
      state = state.pending();
      await service.fetchWords();
      final words = service.words;
      state = state.resolved(words);
    } catch (e) {
      state = state.rejected(e.toString());
    }
  }
}
