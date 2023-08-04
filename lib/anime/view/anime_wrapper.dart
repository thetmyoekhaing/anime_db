import 'package:anime_db/anime/controller/anime_binding.dart';
import 'package:anime_db/anime/controller/anime_navigation.dart';
import 'package:anime_db/anime/view/anime.dart';
import 'package:anime_db/anime/view/anime_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeWrapper extends StatelessWidget {
  const AnimeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AnimeNavigation.id),
      onGenerateRoute: (settings) {
        if (settings.name == AnimeNavigation.anime) {
          return GetPageRoute(
            routeName: AnimeNavigation.anime,
            page: () => Anime(),
            binding: AnimeBindind(),
          );
        } else {
          return GetPageRoute(
            routeName: AnimeNavigation.animeDetail,
            page: () => AnimeDetail(),
            binding: AnimeBindind(),
          );
        }
      },
    );
  }
}
