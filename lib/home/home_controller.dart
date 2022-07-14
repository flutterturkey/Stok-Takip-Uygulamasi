import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stoktakip/login/login_screen.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }

  late User currentUser;
  RxMap<String, dynamic> userData = RxMap({});

  void getUser() async {
    isLoading.value = true;
    currentUser = FirebaseAuth.instance.currentUser!;
    final db = FirebaseFirestore.instance;
    userData.value =
        (await db.collection('users').doc(currentUser.uid).get()).data() ?? {};
    isLoading.value = false;
  }

  logOut() {
    try {
      FirebaseAuth.instance.signOut();

      Get.offAllNamed(LoginScreen.routeName);
    } catch (e) {}
  }
}
