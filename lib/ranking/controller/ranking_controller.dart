import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:anime_db/anime/controller/anime_navigation.dart';
import 'package:anime_db/anime/model/anime_model.dart';
import 'package:anime_db/api/api_model.dart';
import 'package:anime_db/ranking/controller/ranking_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankingController extends _RankingController {
  Future<void> sortByRanking() async {
    try {
      final res = await apiModel.fetchData(
          what: 'anime',
          page: currentPage.toString(),
          param: 'sortBy',
          size: '10',
          paramValue: 'ranking');

      if (res != null) {
        for (var i = 0; i < res['data'].length; i++) {
          final data = AnimeModel.fromJson(res['data'][i]);
          rankingList.value.add(data);
          rankingList.refresh();
          print('added');
        }
      }
    } catch (e) {
      throw Exception('error sort by ranking $e');
    } finally {
      isLoading.value = false;
    }
  }

  void goToDetail({required AnimeModel anime}) {
    animeController.detailAnime = anime;
    print('ranking go detail ${animeController.detailAnime.title}');
    Get.toNamed(AnimeNavigation.animeDetail, id: RankingNavigation.id);
  }

  void _listener() {
    // print('called listener');
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      currentPage.value++;
      sortByRanking();
      isScrollLoading.value = false;
    } else {
      // print('called from else');
      isScrollLoading.value = true;
    }
  }

  @override
  void onInit() {
    sortByRanking();
    super.onInit();
  }

  @override
  void onReady() {
    print("ranking ready");
    scrollController.addListener(() => _listener());
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class _RankingController extends GetxController {
  final AnimeController animeController = Get.find();
  ApiModel apiModel = ApiModel();
  ScrollController scrollController = ScrollController();
  RxList<AnimeModel> rankingList = <AnimeModel>[].obs;
  RxBool isLoading = true.obs;
  RxInt currentPage = 1.obs;
  RxBool isScrollLoading = true.obs;
}
