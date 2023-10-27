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
    apiKey: 'AIzaSyBHEL0QiWs-MjXTkQSEAFuDmkTruM6QrL0',
    appId: '1:991332688559:android:ed9b42d0225f2c84c9ea5a',
    messagingSenderId: '991332688559',
    projectId: 'happyhearts-aed0a',
    storageBucket: 'happyhearts-aed0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPqrdf1nGCEoTc_fS0EWfNS1Tq1XmXKU0',
    appId: '1:991332688559:ios:66bf6cd9d0a0f030c9ea5a',
    messagingSenderId: '991332688559',
    projectId: 'happyhearts-aed0a',
    storageBucket: 'happyhearts-aed0a.appspot.com',
    androidClientId: '991332688559-lop2qio5fc9bh2jv46gdeb81k32hvv7j.apps.googleusercontent.com',
    iosClientId: '991332688559-c0glod1rnaqqrn0jjs8cu6nkqblnld8s.apps.googleusercontent.com',
    iosBundleId: 'com.itufuturz.happyhearts',
  );
}