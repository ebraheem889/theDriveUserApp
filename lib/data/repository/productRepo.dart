import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/util/app_constants.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getPopularProductList(String type) async {
    return await apiClient
        .getData('${AppConstants.POPULAR_PRODUCT_URI}?type=$type');
  }

  Future<Response> getReviewedProductList(String type) async {
    return await apiClient
        .getData('${AppConstants.REVIEWED_PRODUCT_URI}?type=$type');
  }
}
