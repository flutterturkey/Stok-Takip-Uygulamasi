import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/register/register_controller.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = "/registerscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                  key: controller.nameKey,
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                _emptyBox(),
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
                TextFormField(
                  key: controller.passwordSecondKey,
                  controller: controller.passwordSecondController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password (Tekrar)',
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
                        : () => controller.signUpWithEmail(),
                    child: controller.isLoading.isTrue
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Sign up'),
                  ),
                ),
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
