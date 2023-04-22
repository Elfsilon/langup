import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/collection/collection.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/models/word_unit/word_unit.dart';
import 'package:langup/app/dictionary/data/models/word_unit_example/word_unit_example.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/app/dictionary/data/models/word_unit_part_of_speech/word_unit_part_of_speech.dart';
import 'package:path_provider/path_provider.dart';

class HiveBoxNames {
  static const words = 'words';
  static const labels = 'words_labels';
  static const collections = 'collections';
}

class HiveUtils {
  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  static Future<void> _registerAdapters() async {
    Hive.registerAdapter(WordAdapter());
    Hive.registerAdapter(WordUnitAdapter());
    Hive.registerAdapter(WordUnitLabelAdapter());
    Hive.registerAdapter(WordUnitExampleAdapter());
    Hive.registerAdapter(WordUnitPartOfSpeechAdapter());
    Hive.registerAdapter(CollectionAdapter());
  }

  static Future<void> openBoxes() async {
    _registerAdapters();

    await Hive.openBox<Word>(HiveBoxNames.words);
    await Hive.openBox<WordUnitLabel>(HiveBoxNames.labels);
    await Hive.openBox<Collection>(HiveBoxNames.collections);
  }

  static Box<Word> wordsBox() {
    return Hive.box<Word>(HiveBoxNames.words);
  }

  static Box<WordUnitLabel> labelsBox() {
    return Hive.box<WordUnitLabel>(HiveBoxNames.labels);
  }

  static Box<Collection> collectionsBox() {
    return Hive.box<Collection>(HiveBoxNames.collections);
  }

  static void clearBoxes() {
    Hive.box<Word>(HiveBoxNames.words).clear();
    Hive.box<WordUnitLabel>(HiveBoxNames.labels).clear();
    Hive.box<Collection>(HiveBoxNames.collections).clear();
  }
}
