import 'package:anime_db/genre/controller/genre_controller.dart';
import 'package:anime_db/ui/anime_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreDetail extends GetView<GenreController> {
  const GenreDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Text('Sort by Genre'),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        controller.genreId.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: AnimeGridView(
                        scrollController: controller.sortScrollController,
                        itemList: controller.sortByGenre,
                        gestureOnTap: (anime) =>
                            controller.goDetail(anime: anime),
                      ),
                    ),
                  ],
                ),

          // body: MyFutureBuilder(
          //   isLoading: controller.isLoading,
          //   futureFunc: controller.fetchByGenre(),
          //   dataWidget: Column(
          //     children: [
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Center(
          //         child: Text(
          //           controller.genreId.value,
          //           style: const TextStyle(
          //               fontWeight: FontWeight.bold, fontSize: 20),
          //         ),
          //       ),
          //       Expanded(
          //         child: AnimeGridView(
          //           scrollController: controller.sortScrollController,
          //           itemList: controller.sortByGenre,
          //           gestureOnTap: (anime) => controller.goDetail(anime: anime),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
