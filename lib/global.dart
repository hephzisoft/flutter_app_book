import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'common/services/storage.dart';

class Global {
  static late Storage storageService;
  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeFirebase();
    storageService = await Storage().init();
    return this;
  }
}

Future<void> initializeFirebase() async {
  await dotenv.load(fileName: ".env");
  
  String apiKey;

  if (Platform.isAndroid) {
    apiKey = dotenv.env['ANDROID_API_KEY'] ?? '';
  } else if (Platform.isIOS) {
    apiKey = dotenv.env['IOS_API_KEY'] ?? '';
  } else if (Platform.isMacOS) {
    apiKey = dotenv.env['MACOS_API_KEY'] ?? '';
  } else if (Platform.isWindows) {
    apiKey = dotenv.env['WINDOWS_API_KEY'] ?? '';
  } else {
    // Assume Web
    apiKey = dotenv.env['WEB_API_KEY'] ?? '';
  }

  FirebaseOptions options = FirebaseOptions(
    apiKey: apiKey,
    appId: dotenv.env['APP_ID'] ?? '',
    messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['PROJECT_ID'] ?? '',
  );

  await Firebase.initializeApp(options: options);
}
