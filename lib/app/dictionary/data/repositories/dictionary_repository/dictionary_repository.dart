import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/repositories/dictionary_repository/dictionary_repository_hive.dart';
import 'package:langup/core/utils/hive/hive_utils.dart';

final dictionaryRepositoryProvider = Provider<DictionaryRepository>(
  (ref) => DictionaryRepositoryHive(
    wordsBox: HiveUtils.wordsBox(),
    labelsBox: HiveUtils.labelsBox(),
    collectionsBox: HiveUtils.collectionsBox(),
  ),
);

abstract class DictionaryRepository {
  Future<int> wordCount();
  Future<List<Word>> getWords();
  Future<Word?> getWordById(String id);
  Future<void> addWord(Word word);
  Future<void> updateWord(Word updatedWord);
  Future<void> deleteWord(String id);
}
