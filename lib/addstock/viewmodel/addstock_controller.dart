import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddStockController extends GetxController {
  final GlobalKey dateKey = GlobalKey<FormState>();
  final GlobalKey productKey = GlobalKey<FormState>();
  final GlobalKey numberKey = GlobalKey<FormState>();
  final GlobalKey descriptionKey = GlobalKey<FormState>();
  final GlobalKey storeKey = GlobalKey<FormState>();

  final TextEditingController productController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController storeController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  RxList<String> imageList = RxList.empty();

  List<String> unit = ['adet', 'kg', 'g', 'm', 'cm', 'mm', 'm2', 'm3'];
  final Rxn<String?> _selectedUnit = Rxn();

  String get selectedUnit => _selectedUnit.value ?? unit[0];

  @override
  void onInit() {
    dateController.text = DateFormat("dd/MM/yyyy").format(selectedDate);
    super.onInit();
  }

  void selectDate() async {
    selectedDate = await showDatePicker(
            context: Get.context!,
            initialDate: selectedDate,
            firstDate: selectedDate,
            lastDate: selectedDate.add(const Duration(days: 30))) ??
        DateTime.now();
    dateController.text = DateFormat("dd/MM/yyyy").format(selectedDate);
  }

  void changeUnit(String? value) {
    _selectedUnit.value = value ?? unit[0];
  }

  void imagePicker() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageList.add(image.path);
    }
  }

  deleteImage(String imagePath) {
    imageList.removeWhere((element) => element == imagePath);
  }
}
