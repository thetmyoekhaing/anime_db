import 'package:anime_db/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<HomeController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.currentIdx.value,
        onTap: (int idx) => controller.navbarOnTap(idx),
        items: controller.bottomNavbarList.map((navbar) {
          return BottomNavigationBarItem(
            label: navbar.name,
            icon: Icon(navbar.icon),
          );
        }).toList(),
      );
    });
  }
}
