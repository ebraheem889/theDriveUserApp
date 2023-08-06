import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/response/profile_model.dart';
import 'package:the_drive/util/app_constants.dart';

import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class TokenHandlerRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  TokenHandlerRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> refreshtoken() async {
    return await apiClient.postData(
        AppConstants.REFRESH_TOKEN_URI,
        json.encode({
          "accessToken": "${sharedPreferences.getString(AppConstants.TOKEN)}",
          "refreshToken":
              "${sharedPreferences.getString(AppConstants.REFRESH_TOKEN)}"
        }));
  }

  bool isUserHasToken() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }
}
