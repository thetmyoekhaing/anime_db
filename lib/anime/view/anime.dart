import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:anime_db/ui/anime_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Anime extends GetView<AnimeController> {
  Anime({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          automaticallyImplyLeading: false,
          title: const Text(
            'Anime DB',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : AnimeGridView(
                scrollController: controller.scrollController,
                itemList: controller.animeList,
                // gestureOnTap: (AnimeModel anime) => print('tap ${anime.title}'),
                gestureOnTap: (anime) {
                  print('tap ${anime.title}');
                  controller.goDetail(anime: anime);
                },
              ),
        // body: MyFutureBuilder(
        //   isLoading: controller.isLoading,
        //   futureFunc: controller.fetchAnime(controller.currentPage.value),
        //   dataWidget: AnimeGridView(
        //     scrollController: controller.scrollController,
        //     itemList: controller.animeList,
        //     // gestureOnTap: (AnimeModel anime) => print('tap ${anime.title}'),
        //     gestureOnTap: (anime) {
        //       print('tap ${anime.title}');
        //       controller.goDetail(anime: anime);
        //     },
        //   ),
        // ),
      );
      // return Scaffold(
      //   body: animeController.isLoading.value
      //       ? const Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : AnimeGridView(
      //           scrollController: animeController.scrollController,
      //           itemList: animeController.animeList.value,
      //           gestureOnTap: (anime) => animeController.goDetail(anime: anime),
      //         ),
      // );
    });
  }
}
