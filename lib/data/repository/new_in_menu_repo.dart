import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/util/app_constants.dart';

class NewInMenueRepo {
  final ApiClient apiClient;
  NewInMenueRepo({required this.apiClient});

  Future<Response> getNewInMenu() async {
    return await apiClient.postData(AppConstants.NEW_IN_MENU, json.encode({}));
  }

  Future<Response> getNewInMenuById({ID}) async {
    return await apiClient.postData(
        AppConstants.NEW_IN_MENU_BU_ID, json.encode({}));
  }
}
