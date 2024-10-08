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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2fsfMlFSzXJOknn8Hhb2y3Vte-Qleoxg',
    appId: '1:923847194697:android:6b6edb9c1bb0b8369aa798',
    messagingSenderId: '923847194697',
    projectId: 'food-delivery-56d41',
    storageBucket: 'food-delivery-56d41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDI29BR_TTqGx2xD4ID5ef9maqsxY-9sG4',
    appId: '1:923847194697:ios:886bdd1a0f55b3499aa798',
    messagingSenderId: '923847194697',
    projectId: 'food-delivery-56d41',
    storageBucket: 'food-delivery-56d41.appspot.com',
    iosBundleId: 'com.example.dish',
  );

}

class FirebaseOptions {
  const FirebaseOptions({required String apiKey, required String appId, required String messagingSenderId, required String projectId, required String storageBucket, required String iosBundleId});
}