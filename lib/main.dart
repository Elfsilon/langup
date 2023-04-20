import 'package:flutter/material.dart';
import 'package:langup/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:langup/firebase_options/firebase_options_dev.dart'
    as firebase_options_dev;
import 'package:langup/firebase_options/firebase_options_prod.dart'
    as firebase_options_prod;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const currentFlavor = String.fromEnvironment(
    "APP_FLAVOR",
    defaultValue: "dev",
  );
  print(currentFlavor);

  await Firebase.initializeApp(
    options: currentFlavor == "dev"
        ? firebase_options_dev.DefaultFirebaseOptions.currentPlatform
        : firebase_options_prod.DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const AppRoot(),
  );
}
