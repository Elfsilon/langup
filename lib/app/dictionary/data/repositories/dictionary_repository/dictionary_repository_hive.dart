import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/collection/collection.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/app/dictionary/data/repositories/dictionary_repository/dictionary_repository.dart';

class DictionaryRepositoryHive implements DictionaryRepository {
  const DictionaryRepositoryHive({
    required this.wordsBox,
    required this.labelsBox,
    required this.collectionsBox,
  });

  final Box<Word> wordsBox;
  final Box<WordUnitLabel> labelsBox;
  final Box<Collection> collectionsBox;

  @override
  Future<int> wordCount() async {
    return wordsBox.values.length;
  }

  @override
  Future<List<Word>> getWords() async {
    return wordsBox.values.toList();
  }

  @override
  Future<Word?> getWordById(String id) async {
    return wordsBox.get(id);
  }

  @override
  Future<void> addWord(Word word) async {
    await wordsBox.put(word.id, word);
  }

  @override
  Future<void> updateWord(Word updatedWord) async {
    if (wordsBox.containsKey(updatedWord.id)) {
      wordsBox.put(updatedWord.id, updatedWord);
    } else {
      throw Exception(
          "[HiveDictionaryRepository] Word with provided id not found");
    }
  }

  @override
  Future<void> deleteWord(String id) async {
    await wordsBox.delete(id);
  }
}
