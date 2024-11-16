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
    apiKey: 'AIzaSyCES_goCxdRs-KGRlN9mshdptEgv8-p1JY',
    appId: '1:1018002199981:web:f7af78647f9f5bf481bd24',
    messagingSenderId: '1018002199981',
    projectId: 'todo-14-11',
    authDomain: 'todo-14-11.firebaseapp.com',
    storageBucket: 'todo-14-11.firebasestorage.app',
    measurementId: 'G-NZ5J2SEHJH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxvHY9n8bO6mMzlF21SEoN-5EIc7-KS9c',
    appId: '1:1018002199981:android:5c8739e4c68df18881bd24',
    messagingSenderId: '1018002199981',
    projectId: 'todo-14-11',
    storageBucket: 'todo-14-11.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_XfsVrvvq_YELBlAMxeP4Nk8qTz2TGZo',
    appId: '1:1018002199981:ios:668264cac1cff3a181bd24',
    messagingSenderId: '1018002199981',
    projectId: 'todo-14-11',
    storageBucket: 'todo-14-11.firebasestorage.app',
    iosBundleId: 'com.example.todolistApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_XfsVrvvq_YELBlAMxeP4Nk8qTz2TGZo',
    appId: '1:1018002199981:ios:668264cac1cff3a181bd24',
    messagingSenderId: '1018002199981',
    projectId: 'todo-14-11',
    storageBucket: 'todo-14-11.firebasestorage.app',
    iosBundleId: 'com.example.todolistApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCES_goCxdRs-KGRlN9mshdptEgv8-p1JY',
    appId: '1:1018002199981:web:2e717f166982cdf681bd24',
    messagingSenderId: '1018002199981',
    projectId: 'todo-14-11',
    authDomain: 'todo-14-11.firebaseapp.com',
    storageBucket: 'todo-14-11.firebasestorage.app',
    measurementId: 'G-JZJNKBQMYC',
  );

}