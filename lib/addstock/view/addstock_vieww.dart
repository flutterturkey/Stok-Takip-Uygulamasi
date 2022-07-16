import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stoktakip/data/models/stock_model.dart';
import 'package:stoktakip/summary/summary_screen.dart';

import '../viewmodel/addstock_controller.dart';

class AddStockView extends GetWidget<AddStockController> {
  static const String routeName = "/add-stock-view";
  const AddStockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Stok Ekleme',
            style: Get.theme.textTheme.headline6!.copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: Get.width / 2,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _emptyBox(),
                    TextField(
                      onTap: () {
                        controller.selectDate();
                      },
                      controller: controller.dateController,
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.productKey,
                      controller: controller.productController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ürün adı*',
                      ),
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.numberKey,
                      controller: controller.numberController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Miktar*',
                      ),
                    ),
                    _emptyBox(),
                    Obx(
                      () => Row(
                        children: [
                          const Text('Birim:'),
                          const Spacer(),
                          DropdownButton(
                              items: controller.unit
                                  .map((value) => DropdownMenuItem<String>(
                                        key: Key(value),
                                        value: value,
                                        child: Text(value),
                                      ))
                                  .toList(),
                              value: controller.selectedUnit,
                              onChanged: (String? value) =>
                                  controller.changeUnit(value)),
                        ],
                      ),
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.descriptionKey,
                      controller: controller.descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Açıklama',
                      ),
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.storeKey,
                      controller: controller.storeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Depo*',
                      ),
                    ),
                    _emptyBox(),
                    Obx(
                      () => SizedBox(
                        height: Get.height * 0.14,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...controller.imageList.map((imagePath) {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  GestureDetector(
                                    onTap: () => showImagePopUp(imagePath),
                                    child: SizedBox(
                                      width: Get.height * 0.1,
                                      height: Get.height * 0.1,
                                      child: !kIsWeb
                                          ? Image.file(File(imagePath))
                                          : Image.network(imagePath),
                                    ),
                                  ),
                                  DecoratedBox(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () =>
                                          controller.deleteImage(imagePath),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            IconButton(
                                onPressed: () => controller.imagePicker(),
                                icon: const Icon(Icons.image)),
                          ],
                        ),
                      ),
                    ),
                    _emptyBox(),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(SummaryScreen.routeName,
                          arguments: StockModel(
                            productName: controller.productController.text,
                            productCount:
                                int.parse(controller.numberController.text),
                            productUnit: controller.selectedUnit,
                            productDescription:
                                controller.descriptionController.text,
                            productStorageName: controller.storeController.text,
                            date: controller.selectedDate,
                            productImageList: controller.imageList.value,
                          )),
                      child: const Text('Stok Ekleme'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
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

  SizedBox _emptyBox() {
    return SizedBox(
      height: Get.height * 0.05,
    );
  }
}
