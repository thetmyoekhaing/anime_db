import 'package:anime_db/genre/controller/genre_binding.dart';
import 'package:anime_db/genre/view/genre_wrapper.dart';
import 'package:anime_db/home/controller/home_binding.dart';
import 'package:anime_db/home/view/home.dart';
import 'package:anime_db/ranking/controller/ranking_binding.dart';
import 'package:anime_db/ranking/view/ranking_wrapper.dart';
import 'package:get/get.dart';

class RoutePages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/genre',
      page: () => const GenreWrapper(),
      binding: GenreBindind(),
    ),
    GetPage(
      name: '/ranking',
      page: () => const RankingWrapper(),
      binding: RankingBinding(),
    )
  ];
}
