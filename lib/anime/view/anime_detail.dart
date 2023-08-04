import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetail extends GetView<AnimeController> {
  AnimeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey,
            bottom: PreferredSize(
              preferredSize: const Size(double.maxFinite, 50),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    controller.detailAnime.title!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: controller.detailAnime.title!,
                child: Image.network(
                  controller.detailAnime.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    controller.detailAnime.synopsis!,
                    style: const TextStyle(
                        fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Alternative Titles",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.detailAnime.alternativeTitles!.join(', '),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DetailRow(
                    name: 'Ranking',
                    value: controller.detailAnime.ranking.toString(),
                  ),
                  DetailRow(
                    name: 'Episodes',
                    value: controller.detailAnime.episodes.toString(),
                  ),
                  DetailRow(
                    name: 'Genres',
                    value: controller.detailAnime.genres.toString(),
                  ),
                  DetailRow(
                      name: 'Status', value: controller.detailAnime.status!),
                  DetailRow(name: 'Type', value: controller.detailAnime.type!)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white),
              child: const Text('Go to Website'),
              onPressed: () => launchUrl(
                Uri.parse(controller.detailAnime.link!),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String name;
  final String value;
  const DetailRow({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: SingleChildScrollView(
        child: Row(
          children: [
            Text(
              "$name :",
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
