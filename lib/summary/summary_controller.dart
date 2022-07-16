import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stoktakip/data/models/stock_model.dart';

class SummaryController extends GetxController {
  RxBool editMode = false.obs;
  RxBool isLoading = false.obs;

  final TextEditingController dateController = TextEditingController(
      text: DateFormat("dd/MM/yyyy").format(DateTime.now()));
  final TextEditingController productName = TextEditingController();
  final TextEditingController productCount = TextEditingController();
  final TextEditingController productCountType = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productStorageName = TextEditingController();
  final RxList<String> productImage = RxList.empty();
  late StockModel stockData;
  @override
  void onInit() {
    stockData = Get.arguments as StockModel;
    dateController.text =
        DateFormat("dd/MM/yyyy").format(stockData.date ?? DateTime.now());
    productName.text = stockData.productName ?? "";
    productCount.text = '${stockData.productCount ?? ''}';
    productCountType.text = stockData.productUnit ?? "";
    productDescription.text = stockData.productDescription ?? "";
    productStorageName.text = stockData.productStorageName ?? "";
    productImage.value = stockData.productImageList ?? [];
    super.onInit();
  }

  void changeEditMode() {
    editMode.value = !editMode.value;
  }

  void sendToConfirmation() {
    isLoading.value = true;
    try {
      if (stockData.productImageList != null) {
        for (var element in stockData.productImageList!) {
          uploadMedia(File(element));
        }
      }
      submit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> submit() async {
    var db = FirebaseFirestore.instance;
    var ref = db.collection("stockRequests");

    ref.add(stockData.toJson());
  }

  Future<String> uploadMedia(File file) async {
    var uploadTask = FirebaseStorage.instance
        .ref()
        .child(
            "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}")
        .putFile(file);

    uploadTask.snapshotEvents.listen((event) {});

    var storageRef = await uploadTask;

    return await storageRef.ref.getDownloadURL();
  }
}
