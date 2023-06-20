import 'package:anime_db/home/model/bottom_navbar_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIdx = 0.obs;
  List<BottomNavbarModel> bottomNavbarList = [
    BottomNavbarModel(name: 'Home', icon: Icons.home, route: '/'),
    BottomNavbarModel(name: 'Genre', icon: Icons.list_alt, route: '/genre'),
    BottomNavbarModel(name: 'Ranking', icon: Icons.star, route: '/ranking'),
  ];

  void navbarOnTap(int idx) {
    currentIdx.value = idx;
    Get.toNamed(bottomNavbarList[idx].route);
  }
}
