import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:anime_db/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AnimeController());
  }
}
