import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:get/get.dart';

class AnimeBindind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimeController());
  }
}
