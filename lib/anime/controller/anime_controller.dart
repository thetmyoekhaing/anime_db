import 'package:anime_db/anime/controller/anime_navigation.dart';
import 'package:anime_db/anime/model/anime_model.dart';
import 'package:anime_db/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeController extends _AnimeController {
  Future<void> fetchAnime(int currentPage) async {
    print('fetch');
    print('current page $currentPage');
    try {
      // isLoading.value = true;
      final res = await apiModel.fetchData(
          what: 'anime', page: currentPage.toString(), size: '10');
      // totalPage = res['meta']['totalPage'];
      if (res != null) {
        for (var i = 0; i < res['data'].length; i++) {
          final data = AnimeModel.fromJson(res['data'][i]);
          animeList.value.add(data);
          animeList.refresh();
          print('added');
        }
      }
      isLoading.value = false;

      print("fetch done");
    } catch (e) {
      print("catch");
      print(e);
    }
  }

  void _listener() {
    // print('called listener');
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchAnime(++currentPage.value);
    }
  }

  void goDetail({required AnimeModel anime}) {
    print('anime detail --> $anime');
    detailAnime = anime;
    print('detail anime ${detailAnime.title}');
    Get.toNamed(
      AnimeNavigation.animeDetail,
      id: AnimeNavigation.id,
    );
  }

  // @override
  // void onInit() async {
  //   fetchAnime(currentPage.value);
  //   super.onInit();
  // }

  @override
  void onReady() {
    print("anime ready");
    scrollController.addListener(() => _listener());
    super.onReady();
  }

  @override
  void onInit() {
    fetchAnime(currentPage.value);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class _AnimeController extends GetxController {
  ApiModel apiModel = ApiModel();
  ScrollController scrollController = ScrollController();
  RxInt currentPage = 1.obs;
  AnimeModel detailAnime = AnimeModel();
  RxList<AnimeModel> animeList = <AnimeModel>[].obs;
  RxBool isLoading = true.obs;
}
