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
    apiKey: 'AIzaSyACx1-nIES6YZSAII2ZGWkrPhkrpa0OLhs',
    appId: '1:660561097855:web:e25d5338e491fa69887b4a',
    messagingSenderId: '660561097855',
    projectId: 'pincode-fetcher',
    authDomain: 'pincode-fetcher.firebaseapp.com',
    databaseURL: 'https://pincode-fetcher-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pincode-fetcher.appspot.com',
    measurementId: 'G-HR1K51DPG5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeKd6mLo_9vMTaFpGmeU6bBPs8f9VDm0c',
    appId: '1:660561097855:android:4f7dcae5506e4212887b4a',
    messagingSenderId: '660561097855',
    projectId: 'pincode-fetcher',
    databaseURL: 'https://pincode-fetcher-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pincode-fetcher.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBt6LGWM3PoL3iQiE3Dan0US6S6LjHr4ZM',
    appId: '1:660561097855:ios:386a073cdf44d0f3887b4a',
    messagingSenderId: '660561097855',
    projectId: 'pincode-fetcher',
    databaseURL: 'https://pincode-fetcher-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pincode-fetcher.appspot.com',
    iosBundleId: 'com.example.pincodeFetcher',
  );
}