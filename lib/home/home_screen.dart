import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stoktakip/home/home_controller.dart';

import '../core/animation/stack_path_transition.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/homescreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.currentUser.displayName ?? 'Anasayfa'),
        actions: [
          IconButton(
              onPressed: controller.logOut,
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            Expanded(child: Obx(() {
              return Text(controller.userData.toString());
            })),
            Expanded(
              flex: 1,
              child: AnimatedPathDemo(
                curvedValue: 5,
                child: SizedBox(
                    height: 40,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Stoktan alma isteği"))),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: AnimatedPathDemo(
                curvedValue: 5,
                child: SizedBox(
                    height: 40,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Stoktan ekleme isteği"))),
              ),
            ),
            const Spacer(),
            Expanded(flex: 3, child: ListView()),
            const Spacer(),
            Expanded(flex: 3, child: ListView()),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
