import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/app/dictionary/data/repositories/word_labels_repository/word_labels_repository_hive.dart';
import 'package:langup/core/utils/hive/hive_utils.dart';

final wordLabelsRepositoryProvider = Provider<WordLabelsRepository>(
  (ref) => WordLabelsRepositoryHive(
    box: HiveUtils.labelsBox(),
  ),
);

abstract class WordLabelsRepository {
  Future<List<WordUnitLabel>> getLabels();
  Future<WordUnitLabel?> getLabelById(String id);
  Future<void> addLabel(WordUnitLabel word);
  Future<void> updateLabel(WordUnitLabel updatedWord);
  Future<void> deleteLabel(String id);
}
