import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoktakip/summary/summary_controller.dart';

class SummaryScreen extends GetWidget<SummaryController> {
  const SummaryScreen({Key? key}) : super(key: key);

  static String routeName = '/summary_screen';

  @override
  Widget build(BuildContext context) {
    controller.init();
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
                  Obx(
                    () => Container(
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.all(Get.width * 0.04),
                      child: Text(controller.productImage.value),
                    ),
                  ),
                  _divider(),
                  TextFormField(
                    readOnly: true,
                    enabled: false,
                    controller: controller.dateController,
                    decoration: const InputDecoration(
                      labelText: "Tarih",
                    ),
                  ),
                  _divider(),
                  Obx(() => TextFormField(
                        readOnly: controller.editMode.value,
                        controller: controller.productName,
                        decoration: const InputDecoration(
                          labelText: "Ürün Adı",
                        ),
                      )),
                  _divider(),
                  Obx(() => TextFormField(
                        readOnly: controller.editMode.value,
                        controller: controller.productCount,
                        decoration: const InputDecoration(
                          labelText: "Ürün Adedi",
                        ),
                      )),
                  _divider(),
                  Obx(() => TextFormField(
                        readOnly: controller.editMode.value,
                        controller: controller.productCountType,
                        decoration: const InputDecoration(
                          labelText: "Ürün Adedi Birimi",
                        ),
                      )),
                  _divider(),
                  Obx(() => TextFormField(
                        readOnly: controller.editMode.value,
                        controller: controller.productDescription,
                        decoration: const InputDecoration(
                          labelText: "Ürün Açıklaması",
                        ),
                      )),
                  _divider(),
                  Obx(() => TextFormField(
                        readOnly: controller.editMode.value,
                        controller: controller.productStorageName,
                        decoration: const InputDecoration(
                          labelText: "Ürün Deposu",
                        ),
                      )),
                  _divider(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Resim Ekle"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.changeEditMode();
              },
              child: const Text("Düzenle"),
            ),
            _divider(),
            Obx(() => ElevatedButton(
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
                )),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return SizedBox(
      height: Get.height * 0.01,
      width: Get.width * 0.02,
    );
  }
}
