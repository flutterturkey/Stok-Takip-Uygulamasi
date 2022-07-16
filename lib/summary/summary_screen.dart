import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/summary/summary_controller.dart';

class SummaryScreen extends GetWidget<SummaryController> {
  const SummaryScreen({Key? key}) : super(key: key);

  static String routeName = '/summary_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Özet"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...controller.productImage.map((imagePath) {
                        return GestureDetector(
                          onTap: () => showImagePopUp(imagePath),
                          child: SizedBox(
                            width: Get.height * 0.1,
                            height: Get.height * 0.1,
                            child: !kIsWeb
                                ? Image.file(File(imagePath))
                                : Image.network(imagePath),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateController,
                    decoration: const InputDecoration(
                      labelText: "Tarih",
                    ),
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    controller: controller.productName,
                    decoration: const InputDecoration(
                      labelText: "Ürün Adı",
                    ),
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    controller: controller.productCount,
                    decoration: const InputDecoration(
                      labelText: "Ürün Adedi",
                    ),
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    controller: controller.productCountType,
                    decoration: const InputDecoration(
                      labelText: "Ürün Adedi Birimi",
                    ),
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    controller: controller.productDescription,
                    decoration: const InputDecoration(
                      labelText: "Ürün Açıklaması",
                    ),
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    controller: controller.productStorageName,
                    decoration: const InputDecoration(
                      labelText: "Ürün Deposu",
                    ),
                  ),
                  _divider(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Düzenle"),
              ),
            ),
            _divider(),
            Obx(() => Expanded(
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.sendToConfirmation();
                          },
                    child: controller.isLoading.value
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Onaya Gönder"),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void showImagePopUp(String imagePath) {
    Get.defaultDialog(
        title: '',
        content: SizedBox(
          height: Get.height * 0.5,
          width: Get.width * 0.9,
          child:
              !kIsWeb ? Image.file(File(imagePath)) : Image.network(imagePath),
        ));
  }

  Widget _divider() {
    return SizedBox(
      height: Get.height * 0.01,
      width: Get.width * 0.02,
    );
  }
}
