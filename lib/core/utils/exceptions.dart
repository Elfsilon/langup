class AppException implements Exception {
  const AppException([this.message, this.where]);

  final String? message;
  final String? where;

  String get _prefix => "[AppException in $where]";

  @override
  String toString() => message is String ? '$_prefix: $message' : _prefix;
}

class UIValueException extends AppException {
  const UIValueException([super.message, super.where]);

  @override
  String get _prefix => "[UIValueException in $where]";
}
