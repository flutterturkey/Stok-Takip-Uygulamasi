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
    apiKey: 'AIzaSyCRbjTeYd_AwRl3zRpHo4h9Ua_WhdkiGng',
    appId: '1:844068901417:web:328113cdd159ad817fc238',
    messagingSenderId: '844068901417',
    projectId: 'flankarastoktakip',
    authDomain: 'flankarastoktakip.firebaseapp.com',
    storageBucket: 'flankarastoktakip.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdQ_2jMn7_1afNsucWJYNzG0Uqss2ykL0',
    appId: '1:844068901417:android:9dac0124bf1c0d5d7fc238',
    messagingSenderId: '844068901417',
    projectId: 'flankarastoktakip',
    storageBucket: 'flankarastoktakip.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyQBTcbKv5GS5LeeN5SYtHB02_lOt0ajQ',
    appId: '1:844068901417:ios:e18e94c0bca08da47fc238',
    messagingSenderId: '844068901417',
    projectId: 'flankarastoktakip',
    storageBucket: 'flankarastoktakip.appspot.com',
    iosClientId: '844068901417-h0v1ljkb8le1jiqo4i3ve0p2ujm0rivp.apps.googleusercontent.com',
    iosBundleId: 'flutterturkey.stoktakip',
  );
}
