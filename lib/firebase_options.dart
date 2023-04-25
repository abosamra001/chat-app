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
    apiKey: 'AIzaSyC3JJ-sv4qtgOoe7LWF40d-g85e2xKcRJI',
    appId: '1:75799295646:web:e042719c9fe12c4507ed8f',
    messagingSenderId: '75799295646',
    projectId: 'chat-app-b67fe',
    authDomain: 'chat-app-b67fe.firebaseapp.com',
    storageBucket: 'chat-app-b67fe.appspot.com',
    measurementId: 'G-XT2CYPHYLL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4-fdFxRkwvuXGcQmFT4hVcPp2EKwfGP0',
    appId: '1:75799295646:android:2820bf032f02cc9807ed8f',
    messagingSenderId: '75799295646',
    projectId: 'chat-app-b67fe',
    storageBucket: 'chat-app-b67fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCe7kx35OGx7oB95FhUcpoA7N4eTrLUxRs',
    appId: '1:75799295646:ios:123b2e7bbdf56d0a07ed8f',
    messagingSenderId: '75799295646',
    projectId: 'chat-app-b67fe',
    storageBucket: 'chat-app-b67fe.appspot.com',
    iosClientId: '75799295646-8ub3umdq1q983vmosvp1clrfdo8r1i1r.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCe7kx35OGx7oB95FhUcpoA7N4eTrLUxRs',
    appId: '1:75799295646:ios:123b2e7bbdf56d0a07ed8f',
    messagingSenderId: '75799295646',
    projectId: 'chat-app-b67fe',
    storageBucket: 'chat-app-b67fe.appspot.com',
    iosClientId: '75799295646-8ub3umdq1q983vmosvp1clrfdo8r1i1r.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
