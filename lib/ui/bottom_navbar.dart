import 'package:anime_db/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: homeController.currentIdx.value,
        onTap: (int idx) => homeController.navbarOnTap(idx),
        items: homeController.bottomNavbarList.map((navbar) {
          return BottomNavigationBarItem(
            label: navbar.name,
            icon: Icon(navbar.icon),
          );
        }).toList(),
      );
    });
  }
}
