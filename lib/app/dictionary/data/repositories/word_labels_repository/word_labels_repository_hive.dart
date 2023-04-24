import 'package:hive/hive.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/app/dictionary/data/repositories/word_labels_repository/word_labels_repository.dart';

class WordLabelsRepositoryHive implements WordLabelsRepository {
  const WordLabelsRepositoryHive({
    required this.box,
  });

  final Box<WordUnitLabel> box;

  @override
  Future<List<WordUnitLabel>> getLabels() async {
    return box.values.toList();
  }

  @override
  Future<WordUnitLabel?> getLabelById(String id) async {
    return box.get(id);
  }

  @override
  Future<void> addLabel(WordUnitLabel label) async {
    await box.put(label.id, label);
  }

  @override
  Future<void> updateLabel(WordUnitLabel updatedLabel) async {
    if (box.containsKey(updatedLabel.id)) {
      box.put(updatedLabel.id, updatedLabel);
    } else {
      throw Exception(
          "[HiveDictionaryRepository] Label with provided id not found");
    }
  }

  @override
  Future<void> deleteLabel(String id) async {
    await box.delete(id);
  }
}
