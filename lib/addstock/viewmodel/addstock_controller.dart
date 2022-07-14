import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStockController extends GetxController {
  final GlobalKey productKey = GlobalKey<FormState>();
  final GlobalKey numberKey = GlobalKey<FormState>();
  final GlobalKey unitKey = GlobalKey<FormState>();
  final GlobalKey descriptionKey = GlobalKey<FormState>();
  final GlobalKey storeKey = GlobalKey<FormState>();

  final TextEditingController productController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController storeController = TextEditingController();
}
