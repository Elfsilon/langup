import 'package:flutter/material.dart';
import 'package:langup/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:langup/firebase_options/firebase_config.dart';

void main() async {
  await initApp();
  runApp(const AppRoot());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseConfig = FirebaseConfig.fromEnvironment();
  await Firebase.initializeApp(
    options: firebaseConfig.options,
  );
}
