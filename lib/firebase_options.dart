

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
          'run `flutterfire configure` to add it.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD3FsQ8F7nCL65_t8D8mAjd1H1be-YuwQA',
    appId: '1:1063796019050:web:518e8873c8639139c01f13',
    messagingSenderId: '1063796019050',
    projectId: 'task-management-19c84',
    authDomain: 'task-management-19c84.firebaseapp.com',
    storageBucket: 'task-management-19c84.firebasestorage.app',
    measurementId: 'G-8F8L1G811M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5DejZIwuvP58ze-_vcrORg4zhjm_oPLc',
    appId: '1:1063796019050:android:0e2b80065da4b279c01f13',
    messagingSenderId: '1063796019050',
    projectId: 'task-management-19c84',
    storageBucket: 'task-management-19c84.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7YoSsMghlbg5HuLoWgP9TUnlDZSOHmYY',
    appId: '1:1063796019050:ios:a1ab5b5727bfe333c01f13',
    messagingSenderId: '1063796019050',
    projectId: 'task-management-19c84',
    storageBucket: 'task-management-19c84.firebasestorage.app',
    iosBundleId: 'com.example.taskManagementApp',
  );
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7YoSsMghlbg5HuLoWgP9TUnlDZSOHmYY',
    appId: '1:1063796019050:ios:a1ab5b5727bfe333c01f13',
    messagingSenderId: '1063796019050',
    projectId: 'task-management-19c84',
    storageBucket: 'task-management-19c84.firebasestorage.app',
    iosBundleId: 'com.example.taskManagementApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD3FsQ8F7nCL65_t8D8mAjd1H1be-YuwQA',
    appId: '1:1063796019050:web:e34898e13dfe3295c01f13',
    messagingSenderId: '1063796019050',
    projectId: 'task-management-19c84',
    authDomain: 'task-management-19c84.firebaseapp.com',
    storageBucket: 'task-management-19c84.firebasestorage.app',
    measurementId: 'G-WXE86J8PR0',
  );
}
