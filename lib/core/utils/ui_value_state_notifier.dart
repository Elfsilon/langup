import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/core/utils/ui_value.dart';

abstract class UIValueStateNotifier<T> extends StateNotifier<UIValue<T>> {
  UIValueStateNotifier({
    required UIValue<T> initialState,
  }) : super(initialState);

  void resolve(T value) {
    state = state.resolved(value);
  }

  void reject(String reason) {
    state = state.rejected(reason);
  }

  void pending() {
    state = state.pending();
  }

  Future<void> action(
    Future Function() body, {
    bool mustResolve = true,
    bool initialPending = true,
    void Function(Object error)? onError,
  }) async {
    try {
      if (initialPending) {
        pending();
      }
      final result = await body();
      if (mustResolve) {
        resolve(result);
      }
    } catch (e) {
      reject(e.toString());
      onError?.call(e);
    }
  }
}
