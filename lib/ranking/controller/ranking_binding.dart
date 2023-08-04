import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:anime_db/ranking/controller/ranking_controller.dart';
import 'package:get/get.dart';

class RankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RankingController());
    Get.lazyPut(() => AnimeController());
  }
}
