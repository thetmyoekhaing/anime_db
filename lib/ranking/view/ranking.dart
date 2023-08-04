import 'package:anime_db/ranking/controller/ranking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ranking extends StatelessWidget {
  static const name = "ranking";
  final RankingController rankingController = Get.find();
  Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text(
              "Ranking",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          body: rankingController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  controller: rankingController.scrollController,
                  itemCount: rankingController.rankingList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < rankingController.rankingList.length) {
                      final item = rankingController.rankingList[index];
                      return GestureDetector(
                        onTap: () => rankingController.goToDetail(anime: item),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  item.image!,
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                child: Text(
                                  item.title!,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Ranking",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    "${++index}",
                                    style: const TextStyle(
                                        color: Colors.purple,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ));
    });
  }
}
