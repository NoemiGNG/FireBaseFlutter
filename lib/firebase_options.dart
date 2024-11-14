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
    apiKey: 'AIzaSyBhEJPP5pr_AEW4IaGmfCmSHZn2LK9Fcok',
    appId: '1:451849096811:web:50a7ddaf7b17ca3dbaab2e',
    messagingSenderId: '451849096811',
    projectId: 'miappfirebase-36206',
    authDomain: 'miappfirebase-36206.firebaseapp.com',
    storageBucket: 'miappfirebase-36206.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBb5B9C9bBmCWe8M-JoDjTGDs8bRwIliC8',
    appId: '1:451849096811:android:15c5b07f73e63226baab2e',
    messagingSenderId: '451849096811',
    projectId: 'miappfirebase-36206',
    storageBucket: 'miappfirebase-36206.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJBaOWdYEJVp0YtQ5-IqfpeCMZgDz62Fg',
    appId: '1:451849096811:ios:3c6ea88f2c9b933bbaab2e',
    messagingSenderId: '451849096811',
    projectId: 'miappfirebase-36206',
    storageBucket: 'miappfirebase-36206.firebasestorage.app',
    iosBundleId: 'com.noemiGalicia.appFirebase2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJBaOWdYEJVp0YtQ5-IqfpeCMZgDz62Fg',
    appId: '1:451849096811:ios:3c6ea88f2c9b933bbaab2e',
    messagingSenderId: '451849096811',
    projectId: 'miappfirebase-36206',
    storageBucket: 'miappfirebase-36206.firebasestorage.app',
    iosBundleId: 'com.noemiGalicia.appFirebase2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBhEJPP5pr_AEW4IaGmfCmSHZn2LK9Fcok',
    appId: '1:451849096811:web:fb7d470d6a152206baab2e',
    messagingSenderId: '451849096811',
    projectId: 'miappfirebase-36206',
    authDomain: 'miappfirebase-36206.firebaseapp.com',
    storageBucket: 'miappfirebase-36206.firebasestorage.app',
  );
}
