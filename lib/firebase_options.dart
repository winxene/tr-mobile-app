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
    apiKey: 'AIzaSyByAJxUcwo5ldPwnGNHLrIkPSPioihwVZ4',
    appId: '1:963701895505:web:cf7cb4440df731541da370',
    messagingSenderId: '963701895505',
    projectId: 'drinkify-firebase',
    authDomain: 'drinkify-firebase.firebaseapp.com',
    databaseURL: 'https://drinkify-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'drinkify-firebase.appspot.com',
    measurementId: 'G-G4VQZ01XGP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzVK8xI8Z4qUSvjurbeghZonxjm81sYcY',
    appId: '1:963701895505:android:6b89f478c5359ce41da370',
    messagingSenderId: '963701895505',
    projectId: 'drinkify-firebase',
    databaseURL: 'https://drinkify-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'drinkify-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLWcznKOxujFvYJFfHU6jIYPkHeYdpOvU',
    appId: '1:963701895505:ios:bbf6c9eb96aaca061da370',
    messagingSenderId: '963701895505',
    projectId: 'drinkify-firebase',
    databaseURL: 'https://drinkify-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'drinkify-firebase.appspot.com',
    iosClientId: '963701895505-7kdjcvnknbopobpvhcbisd9rrgirupja.apps.googleusercontent.com',
    iosBundleId: 'com.example.trmade',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLWcznKOxujFvYJFfHU6jIYPkHeYdpOvU',
    appId: '1:963701895505:ios:bbf6c9eb96aaca061da370',
    messagingSenderId: '963701895505',
    projectId: 'drinkify-firebase',
    databaseURL: 'https://drinkify-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'drinkify-firebase.appspot.com',
    iosClientId: '963701895505-7kdjcvnknbopobpvhcbisd9rrgirupja.apps.googleusercontent.com',
    iosBundleId: 'com.example.trmade',
  );
}

