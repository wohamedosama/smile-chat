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
    apiKey: 'AIzaSyALo3_TimDijtRBkRHlrboKTWEtuDkAeBk',
    appId: '1:639932064883:web:36288e02dda7bd40ecf606',
    messagingSenderId: '639932064883',
    projectId: 'smile-chat-7450d',
    authDomain: 'smile-chat-7450d.firebaseapp.com',
    storageBucket: 'smile-chat-7450d.firebasestorage.app',
    measurementId: 'G-0M6JN2JZHF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIUJ9M3Op-LYo29dvwyWPHyvbCHA9JNdg',
    appId: '1:639932064883:android:aeb070f985b7ea1becf606',
    messagingSenderId: '639932064883',
    projectId: 'smile-chat-7450d',
    storageBucket: 'smile-chat-7450d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8__558_gjtJd7EvcACx8mNtfXwwj_dKM',
    appId: '1:639932064883:ios:697cd97e1b6e8992ecf606',
    messagingSenderId: '639932064883',
    projectId: 'smile-chat-7450d',
    storageBucket: 'smile-chat-7450d.firebasestorage.app',
    iosBundleId: 'com.example.smileChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8__558_gjtJd7EvcACx8mNtfXwwj_dKM',
    appId: '1:639932064883:ios:697cd97e1b6e8992ecf606',
    messagingSenderId: '639932064883',
    projectId: 'smile-chat-7450d',
    storageBucket: 'smile-chat-7450d.firebasestorage.app',
    iosBundleId: 'com.example.smileChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALo3_TimDijtRBkRHlrboKTWEtuDkAeBk',
    appId: '1:639932064883:web:70034ff29ae6392fecf606',
    messagingSenderId: '639932064883',
    projectId: 'smile-chat-7450d',
    authDomain: 'smile-chat-7450d.firebaseapp.com',
    storageBucket: 'smile-chat-7450d.firebasestorage.app',
    measurementId: 'G-7WH5PQ5RJC',
  );
}
