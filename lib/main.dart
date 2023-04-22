import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langup/app_root.dart';
import 'package:langup/core/utils/hive/hive_utils.dart';

void main() async {
  await initApp();
  runApp(
    const ProviderScope(
      child: AppRoot(),
    ),
  );
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final firebaseConfig = FirebaseConfig.fromEnvironment();
  // await Firebase.initializeApp(
  //   options: firebaseConfig.options,
  // );

  await HiveUtils.init();
  await HiveUtils.openBoxes();
}
