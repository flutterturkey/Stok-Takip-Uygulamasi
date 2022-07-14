import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/home/home_screen.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<bool> isLoading = RxBool(false);
  Rx<String> errorText = RxString('');

  final GlobalKey emailKey = GlobalKey<FormState>();
  final GlobalKey passwordKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login with email and password
  Future<void> loginWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      errorText.value = '';
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading.value = false;

      Get.offAllNamed(HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorText.value = 'Kullanıcı bulunamadı! Kayıt olmaya ne dersiniz?';
      } else if (e.code == 'wrong-password') {
        errorText.value = 'Parolanı gözden geçir!';
      } else {
        errorText.value = e.code;
      }
      isLoading.value = false;
    } catch (e) {
      errorText.value = 'Unknown error';
      isLoading.value = false;
    }
  }

  checkLogin() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2), () {
      if (_auth.currentUser != null) {
        isLoading.value = false;
        Get.offAllNamed(HomeScreen.routeName);
      } else {
        isLoading.value = false;
      }
    });
  }
}
