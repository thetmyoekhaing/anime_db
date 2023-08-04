import 'package:anime_db/home/controller/home_controller.dart';
import 'package:anime_db/ui/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  static const name = "home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
            bottomNavigationBar: const BottomNavBar(),
            body:
                controller.bottomNavbarList[controller.currentIdx.value].body);
      },
    );
  }
}
