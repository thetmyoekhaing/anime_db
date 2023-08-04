import 'package:anime_db/genre/controller/genre_binding.dart';
import 'package:anime_db/genre/view/genre.dart';
import 'package:anime_db/home/controller/home_binding.dart';
import 'package:anime_db/home/view/home.dart';
import 'package:anime_db/ranking/controller/ranking_binding.dart';
import 'package:anime_db/ranking/view/ranking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetPageRoute? routingNavigator(RouteSettings settings) {
  switch (settings.name) {
    case Home.name:
      return GetPageRoute(
        settings: settings,
        page: () => Home(),
      );
    case Genre.name:
      return GetPageRoute(
        settings: settings,
        page: () => Genre(),
        binding: GenreBindind(),
      );
    case Ranking.name:
      return GetPageRoute(
        settings: settings,
        page: () => Ranking(),
        binding: RankingBinding(),
      );
    default:
      return GetPageRoute(
        settings: settings,
        page: () => Home(),
        binding: HomeBinding(),
      );
  }
}
