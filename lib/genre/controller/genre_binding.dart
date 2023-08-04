import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:anime_db/genre/controller/genre_controller.dart';
import 'package:get/get.dart';

class GenreBindind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenreController());
    Get.lazyPut(() => AnimeController());
  }
}
