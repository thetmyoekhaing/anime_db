import 'package:anime_db/anime/controller/anime_controller.dart';
import 'package:anime_db/anime/controller/anime_navigation.dart';
import 'package:anime_db/anime/model/anime_model.dart';
import 'package:anime_db/api/api_model.dart';
import 'package:anime_db/genre/controller/genre_navigation.dart';
import 'package:anime_db/genre/model/genre_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreController extends _GenreController {
  Future<void> fetchGenres() async {
    try {
      final res = await apiModel.fetchData(what: 'genre');
      if (res is List) {
        for (var item in res) {
          final id = item['_id'];
          final addItem = GenreModel(id: id);
          // print(item['_id'].runtimeType);
          genreList.value.add(addItem);
          print('added genre');
          genreList.refresh();
        }
        isLoading.value = false;
      }
    } catch (e) {
      throw Exception('error fetching genres $e');
    } finally {
      isLoading.value == false;
    }
  }

  void setIdAndGoDetail({required String id}) {
    if (id.isNotEmpty) {
      genreId.value = id;
      print("from set and fetch id --> $id");
      fetchByGenre();
      Get.toNamed(GenreNavigation.genreDetail, id: GenreNavigation.id);
    }
  }

  Future<void> fetchByGenre() async {
    sortByGenre.clear();

    print(genreId.value);
    try {
      final res = await apiModel.fetchData(
          what: 'anime',
          param: 'genres',
          paramValue: genreId.value,
          size: '10',
          page: sortCurrentPage.toString());
      print('res ${res.toString()}');
      if (res != null) {
        for (var i = 0; i < res['data'].length; i++) {
          final data = AnimeModel.fromJson(res['data'][i]);
          sortByGenre.value.add(data);
          sortByGenre.refresh();
          print('sort by genre added');
        }
      }
    } catch (e) {
      throw Exception('error sort by genre $e');
    } finally {
      isSortLoading.value = false;
    }
  }

  void goDetail({required AnimeModel anime}) {
    animeController.detailAnime = anime;
    print(animeController.detailAnime.title);
    Get.toNamed(AnimeNavigation.animeDetail, id: GenreNavigation.id);
  }

  void _listener() {
    // print('called listener');
    if (sortScrollController.position.pixels ==
        sortScrollController.position.maxScrollExtent) {
      sortCurrentPage.value++;
      fetchByGenre();
      isScrollLoading.value = false;
    } else {
      // print('called from else');
      isScrollLoading.value = true;
    }
  }

  @override
  void onReady() {
    print("now ready");
    sortScrollController.addListener(() => _listener());
    super.onReady();
  }

  @override
  void onInit() {
    fetchGenres();
    super.onInit();
  }

  @override
  void onClose() {
    sortScrollController.dispose();
    super.onClose();
  }
}

class _GenreController extends GetxController {
  final AnimeController animeController = Get.find();
  ApiModel apiModel = ApiModel();
  RxBool isLoading = true.obs;
  RxBool isSortLoading = true.obs;
  RxBool isScrollLoading = true.obs;
  RxString genreId = ''.obs;

  ScrollController sortScrollController = ScrollController();

  RxList<GenreModel> genreList = <GenreModel>[].obs;
  RxList<AnimeModel> sortByGenre = <AnimeModel>[].obs;
  RxInt sortCurrentPage = 1.obs;
}
