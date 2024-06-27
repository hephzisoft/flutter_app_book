import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/services/storage.dart';
import 'firebase_options.dart';

class Global {
  static late Storage storageService;

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = await Storage().init();
    return this;
  }
}
