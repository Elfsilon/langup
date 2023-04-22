import 'package:uuid/uuid.dart';

abstract class IdGenerator {
  const IdGenerator();

  String generate();
}

class UuidGenerator implements IdGenerator {
  const UuidGenerator();

  @override
  String generate() => const Uuid().v4();
}
