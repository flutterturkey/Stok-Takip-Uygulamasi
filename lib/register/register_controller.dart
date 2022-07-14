import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Rx<bool> isLoading = RxBool(false);
  Rx<String> errorText = RxString('');

  final GlobalKey nameKey = GlobalKey<FormState>();
  final GlobalKey emailKey = GlobalKey<FormState>();
  final GlobalKey passwordKey = GlobalKey<FormState>();
  final GlobalKey passwordSecondKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordSecondController =
      TextEditingController();

  // signupwithemailandpassword
  Future<void> signUpWithEmail() async {
    try {
      errorText.value = '';
      if (passwordController.text == passwordSecondController.text) {
        isLoading.value = true;
        await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        if (_auth.currentUser != null) {
          await _auth.currentUser!.updateDisplayName(nameController.text);

          await db.collection("users").doc(_auth.currentUser!.uid).set({
            'name': _auth.currentUser!.displayName,
            'isAdmin': false
          }).onError((error, stackTrace) => print(error));
        }

        Get.offAllNamed(HomeScreen.routeName);
        isLoading.value = false;
      } else {
        throw Exception('password-doesnt-match');
      }
    } on FirebaseAuthException catch (e) {
      errorText.value = e.message ?? 'Unknown error';
      isLoading.value = false;
    } catch (e) {
      if (e.toString().contains('password-doesnt-match')) {
        errorText.value = 'Parolalar eşleşmiyor!';
      } else {
        errorText.value = 'Unknown error';
      }
    }
  }
}
