import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/util/app_constants.dart';

class CategoryAddOnRepo {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;
  CategoryAddOnRepo({required this.sharedPreferences, required this.apiClient});

  Future<Response> getAllCategories() async {
    return await apiClient.postData(
        AppConstants.ALL_CATEGORIES, json.encode({}));
  } // end of get all categories

  Future<Response> getCategoryById({required String categoryCode}) async {
    return await apiClient.postData(
        AppConstants.CATEGORY_BY_ID,
        json.encode({
          "data": {
            "CategoryCode": {
              "Op": "EQ",
              "Type": "string",
              "Value": "${categoryCode}"
            }
          }
        }));
  } // end of get category by id
}
