import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/data/models/word/word.dart';
import 'package:langup/app/dictionary/data/models/word_unit_label/word_unit_label.dart';
import 'package:langup/app/dictionary/services/word_labels_service.dart';
import 'package:langup/core/utils/ui_value_state_notifier.dart';
import 'package:langup/core/utils/ui_value.dart';

final labelsNotifierProvider = StateNotifierProvider.autoDispose<LabelsNotifier,
    UIValue<List<WordUnitLabel>>>(
  (ref) => LabelsNotifier(
    initialState: const UIValue<List<Word>>([]),
    service: ref.watch(wordLabelsServiceProvider),
  ),
);

class LabelsNotifier extends UIValueStateNotifier<List<Word>> {
  LabelsNotifier({
    required super.initialState,
    required this.service,
  });

  final WordLabelsService service;

  Future<List<WordUnitLabel>> _getLabels() async {
    await service.fetchLabels();
    return service.labels;
  }

  Future<void> getLabels() => action(() async {
        return _getLabels();
      });

  Future<void> addLabel({
    required String title,
  }) =>
      action(() async {
        await service.addLabel(
          title: title,
        );
        return _getLabels();
      });

  Future<void> editLabel({
    required String id,
    String? title,
  }) =>
      action(() async {
        await service.updateLabel(
          id: id,
          title: title,
        );
        return _getLabels();
      });

  Future<void> deleteLabel(String id) => action(() async {
        await service.deleteLabel(id);
        return _getLabels();
      });
}
