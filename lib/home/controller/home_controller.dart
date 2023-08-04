import 'package:anime_db/anime/view/anime_wrapper.dart';
import 'package:anime_db/genre/view/genre_wrapper.dart';
import 'package:anime_db/home/model/bottom_navbar_model.dart';
import 'package:anime_db/ranking/view/ranking_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIdx = 0.obs;
  RxList<BottomNavbarModel> bottomNavbarList = <BottomNavbarModel>[
    BottomNavbarModel(
      name: 'Home',
      icon: Icons.home,
      body: const AnimeWrapper(),
    ),
    BottomNavbarModel(
      name: 'Genre',
      icon: Icons.list_alt,
      body: const GenreWrapper(),
    ),
    BottomNavbarModel(
      name: 'Ranking',
      icon: Icons.star,
      body: const RankingWrapper(),
    ),
  ].obs;

  void navbarOnTap(int idx) {
    currentIdx.value = idx;
  }
}
