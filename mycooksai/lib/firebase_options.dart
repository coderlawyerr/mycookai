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
    apiKey: 'AIzaSyBP12RVaHLVoM3nnPGqN29afcHnIp6VqNo',
    appId: '1:233284536106:web:bd418cc818b42d70230053',
    messagingSenderId: '233284536106',
    projectId: 'mycooksai',
    authDomain: 'mycooksai.firebaseapp.com',
    storageBucket: 'mycooksai.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzau3il-CTqKjtdFUsd7UHo0vrdnOyK6U',
    appId: '1:233284536106:android:d741ffbe2373488c230053',
    messagingSenderId: '233284536106',
    projectId: 'mycooksai',
    storageBucket: 'mycooksai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXQ4yoJmGlSxpsT2ykqLGC7JPLIYPrf3k',
    appId: '1:233284536106:ios:f72542a0c677eabd230053',
    messagingSenderId: '233284536106',
    projectId: 'mycooksai',
    storageBucket: 'mycooksai.appspot.com',
    iosBundleId: 'com.example.mycooksai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXQ4yoJmGlSxpsT2ykqLGC7JPLIYPrf3k',
    appId: '1:233284536106:ios:f72542a0c677eabd230053',
    messagingSenderId: '233284536106',
    projectId: 'mycooksai',
    storageBucket: 'mycooksai.appspot.com',
    iosBundleId: 'com.example.mycooksai',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBP12RVaHLVoM3nnPGqN29afcHnIp6VqNo',
    appId: '1:233284536106:web:eb2572269e6945f7230053',
    messagingSenderId: '233284536106',
    projectId: 'mycooksai',
    authDomain: 'mycooksai.firebaseapp.com',
    storageBucket: 'mycooksai.appspot.com',
  );
}