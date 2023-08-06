import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/util/app_constants.dart';

class BannerRepo {
  final ApiClient apiClient;
  BannerRepo({required this.apiClient});

  Future<Response> getBanners() async {
    return await apiClient.postData(AppConstants.BANNER_URI, json.encode({}));
  }

  Future<Response> getBannerById({ID}) async {
    return await apiClient.postData(
        AppConstants.BANNER_BY_ID_URI, json.encode({}));
  }
}
