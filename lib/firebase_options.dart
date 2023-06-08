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
    apiKey: 'AIzaSyCuI7IaDlIl1wS7cfYfhoKCldsBrz-APuk',
    appId: '1:155934083768:web:b1a483ec94f6d36630424d',
    messagingSenderId: '155934083768',
    projectId: 'engaz-task',
    authDomain: 'engaz-task.firebaseapp.com',
    storageBucket: 'engaz-task.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFQu01Bu2nM6nrILxdlKMHmQ3YxeceXMg',
    appId: '1:155934083768:android:f235b8086e7e992130424d',
    messagingSenderId: '155934083768',
    projectId: 'engaz-task',
    storageBucket: 'engaz-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcbVALTJ_RJ2VT_9QHc0OAjbTTtKWku1g',
    appId: '1:155934083768:ios:e00ef2109852a6f030424d',
    messagingSenderId: '155934083768',
    projectId: 'engaz-task',
    storageBucket: 'engaz-task.appspot.com',
    iosClientId:
        '155934083768-qpadu6gve3j9fu0eepusr0knku37lqpl.apps.googleusercontent.com',
    iosBundleId: 'com.example.engazeTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcbVALTJ_RJ2VT_9QHc0OAjbTTtKWku1g',
    appId: '1:155934083768:ios:f5d82ab4b2f89ec830424d',
    messagingSenderId: '155934083768',
    projectId: 'engaz-task',
    storageBucket: 'engaz-task.appspot.com',
    iosClientId:
        '155934083768-a8ku0dr943o6kup8cbmut9qogascvso2.apps.googleusercontent.com',
    iosBundleId: 'com.example.engazeTask.RunnerTests',
  );
}
