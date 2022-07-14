import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            style: Get.theme.textTheme.headline6!.copyWith(),
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
                    TextFormField(
                      key: controller.productKey,
                      controller: controller.productController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ürün Sayısı',
                      ),
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.numberKey,
                      controller: controller.numberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adet',
                      ),
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.unitKey,
                      controller: controller.unitController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Birim',
                      ),
                    ),
                    _emptyBox(),
                    TextFormField(
                      key: controller.descriptionKey,
                      controller: controller.descriptionController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Açıklama',
                      ),
                    ),
                    TextFormField(
                      key: controller.storeKey,
                      controller: controller.storeController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Depo',
                      ),
                    ),
                    _emptyBox(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Stok Ekleme'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  SizedBox _emptyBox() {
    return SizedBox(
      height: Get.height * 0.05,
    );
  }
}
