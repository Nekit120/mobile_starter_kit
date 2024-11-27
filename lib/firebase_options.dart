// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyACEF0icCjfM_mAY6Ppd3MYNpNqahNb_lk',
    appId: '1:180322139676:web:f2135e644332f62af7e9d9',
    messagingSenderId: '180322139676',
    projectId: 'mobilestarterkit',
    authDomain: 'mobilestarterkit.firebaseapp.com',
    storageBucket: 'mobilestarterkit.firebasestorage.app',
    measurementId: 'G-3V1CQJQSXE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkVQCODnsX_JYzUhRqTqC_WOkQJNOOEJA',
    appId: '1:180322139676:android:dca26f206956b928f7e9d9',
    messagingSenderId: '180322139676',
    projectId: 'mobilestarterkit',
    storageBucket: 'mobilestarterkit.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiA8vg3DnYV2j5lATpNBPtfPdIWRg5oiE',
    appId: '1:180322139676:ios:16c0888319ed5678f7e9d9',
    messagingSenderId: '180322139676',
    projectId: 'mobilestarterkit',
    storageBucket: 'mobilestarterkit.firebasestorage.app',
    iosBundleId: 'com.example.mobileStarterKit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiA8vg3DnYV2j5lATpNBPtfPdIWRg5oiE',
    appId: '1:180322139676:ios:16c0888319ed5678f7e9d9',
    messagingSenderId: '180322139676',
    projectId: 'mobilestarterkit',
    storageBucket: 'mobilestarterkit.firebasestorage.app',
    iosBundleId: 'com.example.mobileStarterKit',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyACEF0icCjfM_mAY6Ppd3MYNpNqahNb_lk',
    appId: '1:180322139676:web:17deeb554436e7f1f7e9d9',
    messagingSenderId: '180322139676',
    projectId: 'mobilestarterkit',
    authDomain: 'mobilestarterkit.firebaseapp.com',
    storageBucket: 'mobilestarterkit.firebasestorage.app',
    measurementId: 'G-E9PPSVRHCB',
  );
}