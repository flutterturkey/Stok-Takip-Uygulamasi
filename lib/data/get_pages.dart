import 'package:get/get.dart';
import 'package:stoktakip/addstock/view/addstock_vieww.dart';
import 'package:stoktakip/home/home_screen.dart';
import 'package:stoktakip/login/login_screen.dart';
import 'package:stoktakip/onboarding/onboarding_screen.dart';
import 'package:stoktakip/register/register_sreen.dart';
import 'package:stoktakip/summary/summary_screen.dart';

List<GetPage> getPages = [
  GetPage(
    name: OnboardingScreen.routeName,
    page: () => const OnboardingScreen(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: SummaryScreen.routeName,
    page: () => const SummaryScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AddStockView.routeName,
    page: () => const AddStockView(),
  ),
  GetPage(
    name: RegisterScreen.routeName,
    page: () => const RegisterScreen(),
  ),
];
