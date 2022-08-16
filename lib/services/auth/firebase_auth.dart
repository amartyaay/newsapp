import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/firebase_options.dart';

final authProvider = Provider(
  (ref) => FirebaseMethods(),
);

class FirebaseMethods {
  Future<void> intialiseApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> googleSignIn() async {
    log('object');
  }
}
