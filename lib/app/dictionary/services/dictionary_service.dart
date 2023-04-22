import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/models/word_unit/word_unit.dart';
import 'package:langup/app/dictionary/data/repositories/dictionary_repository/dictionary_repository.dart';
import 'package:langup/core/utils/exceptions.dart';
import 'package:langup/core/utils/id_generator.dart';

final dictionaryServiceProvider = Provider<DictionaryService>(
  (ref) => DictionaryService(
    dictRepository: ref.watch(dictionaryRepositoryProvider),
  ),
);

class DictionaryService {
  DictionaryService({
    required DictionaryRepository dictRepository,
    IdGenerator idGenerator = const UuidGenerator(),
  })  : _idGenerator = idGenerator,
        _dictRepository = dictRepository;

  final DictionaryRepository _dictRepository;
  final IdGenerator _idGenerator;

  int get size => _cachedSize;
  int _cachedSize = 0;

  Future<void> fetchSize() async {
    final count = await _dictRepository.wordCount();
    _cachedSize = count;
  }

  UnmodifiableListView<Word> get words => UnmodifiableListView(_cachedWords);
  List<Word> _cachedWords = const [];

  Future<void> fetchWords() async {
    final words = await _dictRepository.getWords();
    _cachedWords = words;
  }

  Word? get wordById => _cachedWordById;
  Word? _cachedWordById;

  Future<void> fetchWordById(String id) async {
    final word = await _dictRepository.getWordById(id);
    _cachedWordById = word;
  }

  Future<void> addWord({
    required String name,
    required List<WordUnit> units,
    int priority = 0,
    int points = 0,
    int? collectionId,
  }) async {
    final word = Word(
      id: _idGenerator.generate(),
      units: units,
      name: name,
      collectionId: collectionId,
      points: points,
      priority: priority,
    );
    await _dictRepository.addWord(word);
  }

  Future<void> updateWord({
    required String id,
    String? name,
    List<WordUnit>? units,
    int? priority,
    int? points,
    int? Function()? collectionId,
  }) async {
    final wordToUpdate = await _dictRepository.getWordById(id);
    if (wordToUpdate == null) {
      throw const AppException(
          "No such word in dictionary. (wordToUpdate == null)", "updateWord");
    }

    final updatedWord = wordToUpdate.copyWith(
      name: name,
      units: units,
      priority: priority,
      points: points,
      collectionId: collectionId,
    );
    await _dictRepository.updateWord(updatedWord);
  }

  Future<void> deleteWord(String id) async {
    await _dictRepository.deleteWord(id);
  }
}
