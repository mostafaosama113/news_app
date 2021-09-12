import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;
  static String apiKey = '8160a89473d34255b5f79ab9616cff6a';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future getData({
    @required String path,
    @required Map<String, dynamic> query,
  }) async {
    return await dio.get(path, queryParameters: query);
  }
}
