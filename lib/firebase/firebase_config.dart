import 'package:firebase_core/firebase_core.dart';
import 'package:langup/firebase/firebase_options_dev.dart'
    as firebase_options_dev;
import 'package:langup/firebase/firebase_options_prod.dart'
    as firebase_options_prod;
import 'package:langup/core/utils/app_environment.dart';

class FirebaseConfig {
  const FirebaseConfig({
    required this.options,
  });

  final FirebaseOptions options;

  factory FirebaseConfig.fromEnvironment() {
    return FirebaseConfig(
      options: Environment.isDev
          ? firebase_options_dev.DefaultFirebaseOptions.currentPlatform
          : firebase_options_prod.DefaultFirebaseOptions.currentPlatform,
    );
  }
}
