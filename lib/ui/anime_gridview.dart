import "package:anime_db/anime/model/anime_model.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    required this.gestureOnTap,
    required this.scrollController,
    required this.itemList,
    super.key,
  });
  final ScrollController scrollController;
  final RxList<AnimeModel> itemList;
  final void Function(AnimeModel value) gestureOnTap;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(() {
        return GridView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: itemList.length + 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.48,
          ),
          itemBuilder: (context, index) {
            // animeController.animeList.value.map((anime) {
            if (index < itemList.length) {
              final item = itemList[index];
              return GestureDetector(
                onTap: () => gestureOnTap(item),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: item.title!,
                        child: Image.network(
                          item.image ?? '',
                          height: height * 0.35,
                          fit: BoxFit.cover,
                        ),
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
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      }),
    );
  }
}
