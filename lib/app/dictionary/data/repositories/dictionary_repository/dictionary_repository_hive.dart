import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/repositories/dictionary_repository/dictionary_repository.dart';

class DictionaryRepositoryHive implements DictionaryRepository {
  const DictionaryRepositoryHive({
    required this.box,
  });

  final Box<Word> box;

  @override
  Future<int> wordCount() async {
    return box.values.length;
  }

  @override
  Future<List<Word>> getWords() async {
    return box.values.toList();
  }

  @override
  Future<Word?> getWordById(String id) async {
    return box.get(id);
  }

  @override
  Future<void> addWord(Word word) async {
    await box.put(word.id, word);
  }

  @override
  Future<void> updateWord(Word updatedWord) async {
    if (box.containsKey(updatedWord.id)) {
      box.put(updatedWord.id, updatedWord);
    } else {
      throw Exception(
          "[HiveDictionaryRepository] Word with provided id not found");
    }
  }

  @override
  Future<void> deleteWord(String id) async {
    await box.delete(id);
  }
}
