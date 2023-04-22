import 'package:langup/core/utils/exceptions.dart';

enum UIValueStatus { resolved, pending, rejected, initial }

class UIValue<T> {
  const UIValue(T value)
      : _value = value,
        _status = UIValueStatus.initial,
        _reason = null;

  const UIValue._internal({
    required T value,
    required UIValueStatus status,
    String? reason,
  })  : _value = value,
        _status = status,
        _reason = reason;

  UIValue<T> rejected(String reason) => UIValue._internal(
        value: _value,
        status: UIValueStatus.rejected,
        reason: reason,
      );

  UIValue<T> pending() => UIValue._internal(
        value: _value,
        status: UIValueStatus.pending,
      );

  UIValue<T> resolved(T value) => UIValue._internal(
        value: value,
        status: UIValueStatus.rejected,
      );

  bool get isPending => _status == UIValueStatus.pending;
  bool get isResolved => _status == UIValueStatus.resolved;
  bool get isRejected => _status == UIValueStatus.rejected;

  String get rejectReason {
    if (isRejected) return _reason!;

    if (isPending) {
      throw const UIValueException(
          "There is no rejectReason because value is pending", "rejectReason");
    } else if (isResolved) {
      throw const UIValueException(
          "There is no rejectReason because value is resolved", "rejectReason");
    } else {
      throw const UIValueException("Undefined value status", "rejectReason");
    }
  }

  T get value => _value;

  final T _value;
  final UIValueStatus _status;
  final String? _reason;
}
