import 'package:anime_db/anime/model/anime_model.dart';
import 'package:anime_db/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AnimeController extends GetxController {
  ApiModel apiModel = ApiModel();
  ScrollController scrollController = ScrollController();
  int totalPage = 0;
  RxInt currentPage = 1.obs;
  List<String> pagesList = [];

  RxList<AnimeModel> animeList = <AnimeModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool isScrollLoading = true.obs;

  final PagingController<int, AnimeModel> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> fetchAnime(int currentPage) async {
    isLoading.value = true;
    try {
      final res = await apiModel.fetchData(
          what: 'anime', page: currentPage.toString(), size: '10');
      totalPage = res['meta']['totalPage'];
      // print('total page $totalPage');
      if (res != null) {
        for (var i = 0; i < res['data'].length; i++) {
          final data = AnimeModel.fromJson(res['data'][i]);
          animeList.value.add(data);
          animeList.refresh();
          print('added');
        }
        isLoading.value = false;
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  // void pages() {
  //   if (currentPage.value == 1 && currentPage.value < 4) {
  //     pagesList = [...pagesList, "1", "2", "3", "Next", "Last Page"];
  //   } else {
  //     pagesList = [
  //       "First",
  //       '$currentPage',
  //       '$currentPage+1',
  //       '$currentPage+2',
  //       'Next',
  //       "Last Page"
  //     ];
  //   }
  // }

  @override
  void onInit() async {
    _pagingController.addPageRequestListener((pageKey) {
      fetchAnime(pageKey);
    });
    // scrollController.addListener(() {
    //   if (scrollController.position.maxScrollExtent ==
    //       scrollController.offset) {
    //     print('called');
    //     // fetchAnime(currentPage.value++);
    //     // isScrollLoading.value = false;
    //   } else {
    //     print('called from else');
    //     isScrollLoading.value = true;
    //   }
    // });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
