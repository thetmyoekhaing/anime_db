import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Anime extends StatelessWidget {
  const Anime({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimeController animeController = Get.find();

    double height = MediaQuery.of(context).size.height;
    return Obx(() {
      return Scaffold(
        body: animeController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GridView.builder(
                    controller: animeController.scrollController,
                    shrinkWrap: true,
                    itemCount: animeController.animeList.length + 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      if (index < animeController.animeList.length) {
                        final item = animeController.animeList[index];
                        // animeController.animeList.value.map((anime) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item.image ?? '',
                                height: height * 0.35,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.title ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );

                        // }).toList();
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
      );
    });
  }
}


// body: GridView.count(
//         mainAxisSpacing: 20,
//         crossAxisSpacing: 10,
//         shrinkWrap: true,
//         crossAxisCount: 2,
//         children: [],
//       ),

// Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: animeController.pagesList.map((page) {
//                         print(page);
//                         return TextButton(
//                           onPressed: () => animeController.pageOnPressed(page),
//                           child: Text(page),
//                         );
//                       }).toList(),
//                     )

// GridView.count(
//                     shrinkWrap: true,
//                     controller: animeController.scrollController,
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.5,
//                     crossAxisSpacing: 20,
//                     children: animeController.animeList.value.map((anime) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.network(
//                               anime.image ?? '',
//                               height: height * 0.35,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             anime.title ?? '',
//                             maxLines: 2,
//                             style: const TextStyle(
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),