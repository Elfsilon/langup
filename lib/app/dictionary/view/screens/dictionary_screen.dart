import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/view/controllers/dictionary_screen_controller.dart';

class DictionaryScreen extends ConsumerWidget {
  const DictionaryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dictionaryScreenProvider.notifier).getDictionary();
    });

    final state = ref.watch(dictionaryScreenProvider);

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
