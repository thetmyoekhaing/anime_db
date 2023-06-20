import 'package:anime_db/anime/controller/anime_binding.dart';
import 'package:anime_db/anime/view/anime.dart';
import 'package:anime_db/genre/view/genre.dart';
import 'package:anime_db/home/controller/home_binding.dart';
import 'package:anime_db/home/view/home.dart';
import 'package:anime_db/ranking/view/ranking.dart';
import 'package:get/get.dart';

class RoutePages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => Home(
        body: const Anime(),
      ),
      binding: AnimeBindind(),
    ),
    GetPage(
      name: '/genre',
      page: () => Home(
        body: const Genre(),
      ),
    ),
    GetPage(
      name: '/ranking',
      page: () => Home(
        body: const Ranking(),
      ),
    ),
  ];
}
