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
    apiKey: 'AIzaSyD-sk8o_F5tcb-FmearKVKbPteAzfPTgeA',
    appId: '1:238670859004:web:24b55d266869720db1a579',
    messagingSenderId: '238670859004',
    projectId: 'fitness-app-4a51a',
    authDomain: 'fitness-app-4a51a.firebaseapp.com',
    storageBucket: 'fitness-app-4a51a.appspot.com',
    measurementId: 'G-S36WPHZCC2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRhxbguEWS7C1B5z1A0Z5PKBgXNvDTwHU',
    appId: '1:238670859004:android:87c9d7a3590baf3ab1a579',
    messagingSenderId: '238670859004',
    projectId: 'fitness-app-4a51a',
    storageBucket: 'fitness-app-4a51a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJDdtJxxQXvDfbTYeRUXx7dhPJe7766ds',
    appId: '1:238670859004:ios:bd13c5a0a0414541b1a579',
    messagingSenderId: '238670859004',
    projectId: 'fitness-app-4a51a',
    storageBucket: 'fitness-app-4a51a.appspot.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJDdtJxxQXvDfbTYeRUXx7dhPJe7766ds',
    appId: '1:238670859004:ios:bd13c5a0a0414541b1a579',
    messagingSenderId: '238670859004',
    projectId: 'fitness-app-4a51a',
    storageBucket: 'fitness-app-4a51a.appspot.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-sk8o_F5tcb-FmearKVKbPteAzfPTgeA',
    appId: '1:238670859004:web:100a075069803730b1a579',
    messagingSenderId: '238670859004',
    projectId: 'fitness-app-4a51a',
    authDomain: 'fitness-app-4a51a.firebaseapp.com',
    storageBucket: 'fitness-app-4a51a.appspot.com',
    measurementId: 'G-BKE911PXX3',
  );
}