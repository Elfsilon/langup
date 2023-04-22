import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/models/word_unit/word_unit.dart';
import 'package:langup/app/dictionary/data/models/word_unit_part_of_speech/word_unit_part_of_speech.dart';
import 'package:langup/app/dictionary/data/repositories/hive_dictionary_repository.dart';
import 'package:langup/core/utils/hive/hive_utils.dart';

final db = FirebaseFirestore.instance;

class AppRoot extends StatefulWidget {
  const AppRoot({
    super.key,
  });

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  final repo = HiveDictionaryRepository(
    wordsBox: HiveUtils.wordsBox(),
    labelsBox: HiveUtils.labelsBox(),
    collectionsBox: HiveUtils.collectionsBox(),
  );

  List<Word> words = [];

  Future<void> fetchWords() async {
    final fetchedWords = await repo.getWords();
    setState(() {
      words = fetchedWords;
    });
  }

  void addWord() async {
    final testWord = Word(
      name: "Test",
      units: [
        WordUnit(
          partOfSpeech: WordUnitPartOfSpeech.noun,
          translations: ["Test translation"],
        ),
      ],
    );
    repo.addWord(testWord);
    fetchWords();
  }

  void editWord(Word word) async {
    word.name = word.name == "Test" ? "Changed name" : "Test";
    repo.updateWord(word);
    fetchWords();
  }

  void deleteWord(String id) async {
    repo.deleteWord(id);
    fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchWords();
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            final word = words[index];
            return GestureDetector(
              onTap: () => editWord(word),
              onDoubleTap: () => deleteWord(word.id),
              child: Text("${word.id}: ${word.name}"),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addWord,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
