import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/verification_controller.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/profile_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/token_handler_repo.dart';
import 'package:the_drive/data/shared/enums.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/fire_base.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/app_constants.dart';
import 'package:the_drive/view/base/customPhoneNumber/phone_number.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/screen/home/home.dart';

import 'package:http/http.dart' as http;
import '../data/repository/auth_repo.dart';

class TokenHandlerController extends GetxController implements GetxService {
  final TokenHandlerRepo tokenHandlerRepo;
  final SharedPreferences sharedPreferences;
  TokenHandlerController(
      {required this.tokenHandlerRepo, required this.sharedPreferences}) {}

  Future<String?> getAccessToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN);
  }

  Future<DateTime?> getTokenExpirationTime() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      final decodedToken = await Jwt.getExpiryDate(accessToken);

      final parsedDate = DateTime.parse(decodedToken.toString());

      final expirationTime = parsedDate;
      return expirationTime;
    }
    return null;
  }

  Future<bool> isTokenExpired() async {
    final expirationTime = await getTokenExpirationTime();
    return expirationTime != null && expirationTime.isBefore(DateTime.now());
  }

  Future<String?> getRefreshToken() async {
    return await sharedPreferences.getString(AppConstants.REFRESH_TOKEN);
  }

  Future<void> refreshToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken != null) {
      try {
        Response response = await tokenHandlerRepo.refreshtoken();
        log("refresh response ============>" + response.body.toString());
        await sharedPreferences.setString(
            AppConstants.TOKEN, response.body['data']["accessToken"]);
        await sharedPreferences.setString(
            AppConstants.REFRESH_TOKEN, response.body['data']["refreshToken"]);
        final newAccessTokenExpirationTime = getTokenExpirationTime();
      } catch (e) {
        // Handle API error
      }
    } else {
      // Redirect to login screen
      Get.find<AuthController>().clearSharedData();
      Get.offAllNamed(RouteHelper.getLoginPage());
    }
  }

  bool hasToken() {
    return tokenHandlerRepo.isUserHasToken();
  }
}
