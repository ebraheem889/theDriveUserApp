import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/util/app_constants.dart';

class AddOnRepo {
  final ApiClient apiClient;
  AddOnRepo({required this.apiClient});

  Future<Response> productAddOns({required String category}) async {
    return await apiClient.postData(
        AppConstants.PRODUCT_ADD_ONS,
        json.encode({
          "data": {
            "CategoryCode": {
              "Op": "EQ",
              "Type": "string",
              "Value": "${category}"
            }
          }
        }));
  }

  Future<Response> getAddOns() async {
    return await apiClient.postData(AppConstants.ALL_ADD_ONS, json.encode({}));
  }
}
