// ignore_for_file: file_names

import 'package:dio/dio.dart';

abstract class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio!.put(url, data: data, queryParameters: query);
  }

  static Future<Response> getDataAPI({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio!.get(url, queryParameters: query);
  }
}
