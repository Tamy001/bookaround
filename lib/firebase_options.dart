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
    apiKey: 'AIzaSyBpEdzkJf_eCXonOhmfmwclRSpfBC1A8Y4',
    appId: '1:316988508128:web:f2e8a3ed7513b8beaf8d85',
    messagingSenderId: '316988508128',
    projectId: 'bookaround-ac793',
    authDomain: 'bookaround-ac793.firebaseapp.com',
    storageBucket: 'bookaround-ac793.appspot.com',
    measurementId: 'G-3D5NES44QP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVNEqPFKolrN4LTdnmAmJfpPTYz8HabrY',
    appId: '1:316988508128:android:147a20621abb4d11af8d85',
    messagingSenderId: '316988508128',
    projectId: 'bookaround-ac793',
    storageBucket: 'bookaround-ac793.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo8Np278JkwNdbhRT7Uf9Zyoaion4tG3Q',
    appId: '1:316988508128:ios:6220ba0044dd5ceaaf8d85',
    messagingSenderId: '316988508128',
    projectId: 'bookaround-ac793',
    storageBucket: 'bookaround-ac793.appspot.com',
    androidClientId: '316988508128-c88apcadd8ct3mss24tg76sdjg3tpjhf.apps.googleusercontent.com',
    iosClientId: '316988508128-mofisjlcrqg16cg94q83hctjn4d8gcce.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAo8Np278JkwNdbhRT7Uf9Zyoaion4tG3Q',
    appId: '1:316988508128:ios:22bc009ffa2c0fafaf8d85',
    messagingSenderId: '316988508128',
    projectId: 'bookaround-ac793',
    storageBucket: 'bookaround-ac793.appspot.com',
    androidClientId: '316988508128-c88apcadd8ct3mss24tg76sdjg3tpjhf.apps.googleusercontent.com',
    iosClientId: '316988508128-jajfg2kn2l59q0dseue38sev3ekcs3f4.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookaround.RunnerTests',
  );
}