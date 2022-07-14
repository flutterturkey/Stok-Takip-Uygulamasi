import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/login/login_controller.dart';
import 'package:stoktakip/register/register_sreen.dart';

class LoginScreen extends GetWidget<LoginController> {
  static const String routeName = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkLogin();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SizedBox(
          width: Get.width / 2,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  key: controller.emailKey,
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                _emptyBox(),
                TextFormField(
                  key: controller.passwordKey,
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                _emptyBox(),
                Obx(
                  () => Text(controller.errorText.value,
                      style: TextStyle(
                        color: Get.theme.errorColor,
                      )),
                ),
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.isTrue
                        ? null
                        : () => controller.loginWithEmailAndPassword(),
                    child: controller.isLoading.isTrue
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Login'),
                  ),
                ),
                TextButton(
                    onPressed: () => Get.toNamed(RegisterScreen.routeName),
                    child: const Text('Sign up'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _emptyBox() {
    return SizedBox(
      height: Get.height * 0.05,
    );
  }
}
