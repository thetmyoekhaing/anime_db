import 'package:anime_db/anime/controller/anime_binding.dart';
import 'package:anime_db/anime/controller/anime_navigation.dart';
import 'package:anime_db/anime/view/anime_detail.dart';
import 'package:anime_db/genre/controller/genre_binding.dart';
import 'package:anime_db/genre/controller/genre_navigation.dart';
import 'package:anime_db/genre/view/genre.dart';
import 'package:anime_db/genre/view/genre.detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreWrapper extends StatelessWidget {
  const GenreWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    print('hiiiii from genre wrapper');
    return Navigator(
      key: Get.nestedKey(GenreNavigation.id),
      onGenerateRoute: (settings) {
        print('setting name : ${settings.name}');
        if (settings.name == GenreNavigation.genreDetail) {
          return GetPageRoute(
            routeName: GenreNavigation.genre,
            page: () => const GenreDetail(),
            binding: GenreBindind(),
          );
        } else if (settings.name == AnimeNavigation.animeDetail) {
          return GetPageRoute(
            routeName: AnimeNavigation.animeDetail,
            page: () => AnimeDetail(),
          );
        } else {
          return GetPageRoute(
            routeName: GenreNavigation.genre,
            page: () => Genre(),
            binding: GenreBindind(),
          );
        }
      },
    );
  }
}
