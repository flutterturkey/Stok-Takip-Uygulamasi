import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/firebase_options.dart';
import 'package:stoktakip/onboarding/onboarding_screen.dart';

import 'data/get_controllers.dart';
import 'data/get_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _getControllers() async {
    getControllers();
  }

  @override
  Widget build(BuildContext context) {
    _getControllers();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home: const OnboardingScreen(),
    );
  }
}
