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
    apiKey: 'AIzaSyC8h3VY5xWfMWNDWZ7FOLGHoDRT-1hmscQ',
    appId: '1:47414448574:web:ccc0650b62c691fac529ef',
    messagingSenderId: '47414448574',
    projectId: 'com-hephzisoft-appbook',
    authDomain: 'com-hephzisoft-appbook.firebaseapp.com',
    databaseURL: 'https://com-hephzisoft-appbook-default-rtdb.firebaseio.com',
    storageBucket: 'com-hephzisoft-appbook.appspot.com',
    measurementId: 'G-SMFWF13THE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHLSCrRVe_6uulzkWUK7ZV2YrND3NKoJg',
    appId: '1:47414448574:android:41cc730c79322bbec529ef',
    messagingSenderId: '47414448574',
    projectId: 'com-hephzisoft-appbook',
    databaseURL: 'https://com-hephzisoft-appbook-default-rtdb.firebaseio.com',
    storageBucket: 'com-hephzisoft-appbook.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV5RHzp8m04ccHGChDw--F_moFOYKzPbU',
    appId: '1:47414448574:ios:8ffa20e5bd50e6ccc529ef',
    messagingSenderId: '47414448574',
    projectId: 'com-hephzisoft-appbook',
    databaseURL: 'https://com-hephzisoft-appbook-default-rtdb.firebaseio.com',
    storageBucket: 'com-hephzisoft-appbook.appspot.com',
    androidClientId: '47414448574-7c59ijdi5224jc121d3r7ref4p9cd3v8.apps.googleusercontent.com',
    iosClientId: '47414448574-ldeokt25kuimk6geqq5rvvpp2ka1l6gj.apps.googleusercontent.com',
    iosBundleId: 'com.hephzisoft.appBook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBV5RHzp8m04ccHGChDw--F_moFOYKzPbU',
    appId: '1:47414448574:ios:8ffa20e5bd50e6ccc529ef',
    messagingSenderId: '47414448574',
    projectId: 'com-hephzisoft-appbook',
    databaseURL: 'https://com-hephzisoft-appbook-default-rtdb.firebaseio.com',
    storageBucket: 'com-hephzisoft-appbook.appspot.com',
    androidClientId: '47414448574-7c59ijdi5224jc121d3r7ref4p9cd3v8.apps.googleusercontent.com',
    iosClientId: '47414448574-ldeokt25kuimk6geqq5rvvpp2ka1l6gj.apps.googleusercontent.com',
    iosBundleId: 'com.hephzisoft.appBook',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC8h3VY5xWfMWNDWZ7FOLGHoDRT-1hmscQ',
    appId: '1:47414448574:web:c2b6e9219a084f35c529ef',
    messagingSenderId: '47414448574',
    projectId: 'com-hephzisoft-appbook',
    authDomain: 'com-hephzisoft-appbook.firebaseapp.com',
    databaseURL: 'https://com-hephzisoft-appbook-default-rtdb.firebaseio.com',
    storageBucket: 'com-hephzisoft-appbook.appspot.com',
    measurementId: 'G-0Q7CXYYF8F',
  );

}