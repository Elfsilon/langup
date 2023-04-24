import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app/dictionary/view/controllers/collections_notifier.dart';

class CollectionsScreen extends ConsumerWidget {
  const CollectionsScreen({
    super.key,
  });

  CollectionsNotifierProvider get _provider => collectionsNotifierProvider;

  void onInit(WidgetRef ref) {
    updateDictionary(ref);
  }

  void updateDictionary(WidgetRef ref) {
    final provider = ref.read(_provider.notifier);
    provider.getCollections();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit(ref));

    final state = ref.watch(_provider);

    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Text("Text $index");
      },
    );
  }
}
