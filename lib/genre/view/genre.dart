import 'package:anime_db/genre/controller/genre_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Genre extends GetView<GenreController> {
  static const name = "genre";
  Genre({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "Genre",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2.5,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 10),
                          shrinkWrap: true,
                          itemCount: controller.genreList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => controller.setIdAndGoDetail(
                                  id: controller.genreList[index].id!),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.genreList[index].id!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                // MyFutureBuilder(
                //   isLoading: controller.isLoading,
                //   futureFunc: controller.fetchGenres(),
                //   dataWidget: Expanded(
                //     child: GridView.builder(
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //               childAspectRatio: 2.5,
                //               crossAxisCount: 2,
                //               mainAxisSpacing: 20,
                //               crossAxisSpacing: 10),
                //       shrinkWrap: true,
                //       itemCount: controller.genreList.length,
                //       itemBuilder: (context, index) {
                //         return GestureDetector(
                //           onTap: () => controller.setIdAndGoDetail(
                //               id: controller.genreList[index].id!),
                //           child: Container(
                //             margin: const EdgeInsets.symmetric(horizontal: 10),
                //             padding: const EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade300,
                //               boxShadow: [
                //                 BoxShadow(
                //                   blurRadius: 2,
                //                   color: Colors.black.withOpacity(0.7),
                //                 ),
                //               ],
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             child: Center(
                //               child: Text(
                //                 controller.genreList[index].id!,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.w600, fontSize: 20),
                //               ),
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
