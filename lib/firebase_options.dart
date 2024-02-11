// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
        return macos;
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
    apiKey: 'AIzaSyAhC_DmBOHJWU1HX0AihQJXv8n8qLE37Wc',
    appId: '1:274075340171:web:45b7dff8b601864f15b38e',
    messagingSenderId: '274075340171',
    projectId: 'words-power-hbd80',
    authDomain: 'words-power-hbd80.firebaseapp.com',
    storageBucket: 'words-power-hbd80.appspot.com',
    measurementId: 'G-29QQ25PGS6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtaZr3ZKAj5ECAzlGGWZMvUHivzEW5JAY',
    appId: '1:274075340171:android:29aa3e8c599fab5815b38e',
    messagingSenderId: '274075340171',
    projectId: 'words-power-hbd80',
    storageBucket: 'words-power-hbd80.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBwHRrSYd47mb6343M7mTaLLuu3CqBVEQ',
    appId: '1:274075340171:ios:fce90e370326ede015b38e',
    messagingSenderId: '274075340171',
    projectId: 'words-power-hbd80',
    storageBucket: 'words-power-hbd80.appspot.com',
    iosBundleId: 'com.example.wordsPower',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBwHRrSYd47mb6343M7mTaLLuu3CqBVEQ',
    appId: '1:274075340171:ios:62b266fcaf3ed68f15b38e',
    messagingSenderId: '274075340171',
    projectId: 'words-power-hbd80',
    storageBucket: 'words-power-hbd80.appspot.com',
    iosBundleId: 'com.example.wordsPower.RunnerTests',
  );
}
