import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/login/login_screen.dart';
import 'package:stoktakip/onboarding/onboarding_controller.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () => Get.offAllNamed(LoginScreen.routeName),
                child: const Text('go to auth'))));
  }
}
