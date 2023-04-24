import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/view/controllers/dictionary_notifier.dart';

class DictionaryScreen extends ConsumerWidget {
  const DictionaryScreen({
    super.key,
  });

  DictionaryNotifierProvider get _provider => dictionaryNotifierProvider;

  void onInit(WidgetRef ref) {
    updateDictionary(ref);
  }

  void updateDictionary(WidgetRef ref) {
    final provider = ref.read(_provider.notifier);
    provider.getDictionary();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit(ref));

    final state = ref.watch(_provider);

    return ListView.builder(
      itemCount: state.value.length,
      itemBuilder: (context, index) {
        final word = state.value[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            "${word.id}: ${word.name}",
          ),
        );
      },
    );
  }
}
