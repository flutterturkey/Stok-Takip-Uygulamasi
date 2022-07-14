import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  RxBool editMode = false.obs;
  RxBool isLoading = false.obs;

  final TextEditingController dateController =
      TextEditingController(text: DateTime.now().toString());
  final TextEditingController productName = TextEditingController();
  final TextEditingController productCount = TextEditingController();
  final TextEditingController productCountType = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productStorageName = TextEditingController();
  final RxString productImage = RxString("ürün resmi");

  void init() {}

  void changeEditMode() {
    editMode.value = !editMode.value;
  }

  void sendToConfirmation() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}
