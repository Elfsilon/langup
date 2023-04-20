// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_prod.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcwRjt6BV1NQghDCNKM2jzecJ0scb9KME',
    appId: '1:115158149230:web:cd9f5b5d2d6a2d223a9e7f',
    messagingSenderId: '115158149230',
    projectId: 'lang-up',
    authDomain: 'lang-up.firebaseapp.com',
    storageBucket: 'lang-up.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEx7KpjsT-FNfxUDVFMdGBrl4wO0LZCFY',
    appId: '1:115158149230:android:a5639b4751d39d1d3a9e7f',
    messagingSenderId: '115158149230',
    projectId: 'lang-up',
    storageBucket: 'lang-up.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwYh1DCJyf9SopWbKTGUXf3DJr2Yrk7jc',
    appId: '1:115158149230:ios:51718f2e68b520c43a9e7f',
    messagingSenderId: '115158149230',
    projectId: 'lang-up',
    storageBucket: 'lang-up.appspot.com',
    iosClientId: '115158149230-k4movher3f89ttga5e7r1pp306lpi1vc.apps.googleusercontent.com',
    iosBundleId: 'com.example.engup',
  );
}