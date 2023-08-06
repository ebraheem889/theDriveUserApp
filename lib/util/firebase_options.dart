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
    apiKey: 'AIzaSyDUpgKM_cvySrlmGgy7lmWBAeeKdPpv530',
    appId: '1:188446669753:web:be366dfe872724f3589468',
    messagingSenderId: '188446669753',
    projectId: 'thedrive-8cd03',
    authDomain: 'thedrive-8cd03.firebaseapp.com',
    storageBucket: 'thedrive-8cd03.appspot.com',
    measurementId: 'G-BTL316L2T2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh7brB0uZS9qWvYlAq00EBu_TUkdZ0Aho',
    appId: '1:188446669753:android:8bd66b4852bc56b7589468',
    messagingSenderId: '188446669753',
    projectId: 'thedrive-8cd03',
    storageBucket: 'thedrive-8cd03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeGecQ_eKtD_97wK-DNRa2TMsuogItuuw',
    appId: '1:188446669753:ios:73f2a388fc191a7b589468',
    messagingSenderId: '188446669753',
    projectId: 'thedrive-8cd03',
    storageBucket: 'thedrive-8cd03.appspot.com',
    androidClientId: '188446669753-7cjft7jvcc4rj1dkhohqoud3ec9mlnh8.apps.googleusercontent.com',
    iosClientId: '188446669753-u8lnre6grn88njhbbn6ack0c5uetcc3r.apps.googleusercontent.com',
    iosBundleId: 'com.example.theDrive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeGecQ_eKtD_97wK-DNRa2TMsuogItuuw',
    appId: '1:188446669753:ios:73f2a388fc191a7b589468',
    messagingSenderId: '188446669753',
    projectId: 'thedrive-8cd03',
    storageBucket: 'thedrive-8cd03.appspot.com',
    androidClientId: '188446669753-7cjft7jvcc4rj1dkhohqoud3ec9mlnh8.apps.googleusercontent.com',
    iosClientId: '188446669753-u8lnre6grn88njhbbn6ack0c5uetcc3r.apps.googleusercontent.com',
    iosBundleId: 'com.example.theDrive',
  );
}
