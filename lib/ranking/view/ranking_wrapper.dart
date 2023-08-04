import 'package:anime_db/anime/controller/anime_binding.dart';
import 'package:anime_db/anime/controller/anime_navigation.dart';
import 'package:anime_db/anime/view/anime_detail.dart';
import 'package:anime_db/ranking/controller/ranking_binding.dart';
import 'package:anime_db/ranking/controller/ranking_navigation.dart';
import 'package:anime_db/ranking/view/ranking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankingWrapper extends StatelessWidget {
  const RankingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RankingNavigation.id),
      onGenerateRoute: (settings) {
        if (settings.name == AnimeNavigation.animeDetail) {
          return GetPageRoute(
            routeName: AnimeNavigation.animeDetail,
            page: () => AnimeDetail(),
          );
        } else {
          return GetPageRoute(
            routeName: RankingNavigation.ranking,
            page: () => Ranking(),
            binding: RankingBinding(),
          );
        }
      },
    );
  }
}
