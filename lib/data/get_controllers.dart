import 'package:get/get.dart';
import 'package:stoktakip/addstock/viewmodel/addstock_controller.dart';
import 'package:stoktakip/home/home_controller.dart';
import 'package:stoktakip/login/login_controller.dart';
import 'package:stoktakip/onboarding/onboarding_controller.dart';
import 'package:stoktakip/register/register_controller.dart';
import 'package:stoktakip/summary/summary_controller.dart';

Future getControllers() async {
  Get.create(() => OnboardingController(), permanent: false);
  Get.create(() => LoginController(), permanent: false);
  Get.create(() => SummaryController(), permanent: false);
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => AddStockController(), permanent: false);
  Get.create(() => RegisterController(), permanent: false);
}
