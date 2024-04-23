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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBU5e8YFUEX3HCdrCx-ZLqGAES2lBmzrsI',
    appId: '1:17541395010:android:d4fec3a8c81449053473db',
    messagingSenderId: '17541395010',
    projectId: 'buraco-plus-flutter-edition',
    storageBucket: 'buraco-plus-flutter-edition.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9RyAjQEOEk_Q3A1gRg_QLaUCYHAj2tvQ',
    appId: '1:17541395010:ios:316175069afb08e63473db',
    messagingSenderId: '17541395010',
    projectId: 'buraco-plus-flutter-edition',
    storageBucket: 'buraco-plus-flutter-edition.appspot.com',
    iosBundleId: 'com.mediasouls.buracoPlusFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9RyAjQEOEk_Q3A1gRg_QLaUCYHAj2tvQ',
    appId: '1:17541395010:ios:316175069afb08e63473db',
    messagingSenderId: '17541395010',
    projectId: 'buraco-plus-flutter-edition',
    storageBucket: 'buraco-plus-flutter-edition.appspot.com',
    iosBundleId: 'com.mediasouls.buracoPlusFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB-QewOfpduHrcbfd5nxn4UakI319mNBnM',
    appId: '1:17541395010:web:d9b2f70b99731abb3473db',
    messagingSenderId: '17541395010',
    projectId: 'buraco-plus-flutter-edition',
    authDomain: 'buraco-plus-flutter-edition.firebaseapp.com',
    storageBucket: 'buraco-plus-flutter-edition.appspot.com',
    measurementId: 'G-3886VL82GY',
  );

}