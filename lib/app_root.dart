import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langup/app/dictionary/view/screens/dictionary_screen.dart';

final db = FirebaseFirestore.instance;

class AppRoot extends StatefulWidget {
  const AppRoot({
    super.key,
  });

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: DictionaryScreen(),
      ),
    );
  }
}
