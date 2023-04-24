import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/app/dictionary/data/repositories/word_labels_repository/word_labels_repository.dart';
import 'package:langup/core/utils/exceptions.dart';
import 'package:langup/core/utils/id_generator.dart';

final wordLabelsServiceProvider = Provider<WordLabelsService>(
  (ref) => WordLabelsService(
    repository: ref.watch(wordLabelsRepositoryProvider),
  ),
);

class WordLabelsService {
  WordLabelsService({
    required WordLabelsRepository repository,
    IdGenerator idGenerator = const UuidGenerator(),
  })  : _idGenerator = idGenerator,
        _repository = repository;

  final WordLabelsRepository _repository;
  final IdGenerator _idGenerator;

  UnmodifiableListView<WordUnitLabel> get labels =>
      UnmodifiableListView(_cachedLabels);
  List<WordUnitLabel> _cachedLabels = const [];

  Future<void> fetchLabels() async {
    final items = await _repository.getLabels();
    _cachedLabels = items;
  }

  WordUnitLabel? get labelById => _cachedLabelById;
  WordUnitLabel? _cachedLabelById;

  Future<void> fetchLabelById(String id) async {
    final item = await _repository.getLabelById(id);
    _cachedLabelById = item;
  }

  Future<void> addLabel({
    required String title,
  }) async {
    final item = WordUnitLabel(
      id: _idGenerator.generate(),
      title: title,
    );
    await _repository.addLabel(item);
  }

  Future<void> updateLabel({
    required String id,
    String? title,
  }) async {
    final labelToUpdate = await _repository.getLabelById(id);
    if (labelToUpdate == null) {
      throw const AppException(
        "No such label in dictionary. (labelToUpdate == null)",
        "updateLabel",
      );
    }

    final updatedLabel = labelToUpdate.copyWith(
      title: title,
    );
    await _repository.updateLabel(updatedLabel);
  }

  Future<void> deleteLabel(String id) async {
    await _repository.deleteLabel(id);
  }
}
