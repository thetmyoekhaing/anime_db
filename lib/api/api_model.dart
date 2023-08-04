import 'package:anime_db/constant/constant.dart';
import 'package:dio/dio.dart';

class ApiModel {
  Dio dio = Dio();

  Future<dynamic> fetchData({
    required String what,
    String? page,
    String? size,
    String? param,
    String? paramValue,
  }) async {
    Map<String, String> headers = {
      'X-RapidAPI-Key': apiKey2,
      'X-RapidAPI-Host': apiHost
    };

    String url = '$baseUrl/$what';
    if (page != null && size != null && what == 'anime') {
      url = '$baseUrl/$what?page=$page&size=$size';
    }

    if (param != null && paramValue != null) {
      url = '$baseUrl/$what?page=$page&size=$size&$param=$paramValue';
    }

    try {
      print(url);
      final res = await dio.get(
        url,
        options: Options(headers: headers),
      );
      // print(res);
      if (res.statusCode == 200) return res.data;
    } catch (e) {
      throw Exception("Fetching Error $e");
    }
  }
}
