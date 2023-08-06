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

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(String phone, String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URI,
        json.encode({"username": phone, "password": password}));
  }

  Future<Response> getProfileInfo() async {
    return await apiClient.getData(AppConstants.PROFILE_URI);
  }

  Future<Response> changePassword(
      ProfileModel userInfoModel, String password) async {
    return await apiClient.postData(AppConstants.UPDATE_PROFILE_URI, {
      '_method': 'put',
      'f_name': userInfoModel.fName,
      'l_name': userInfoModel.lName,
      'phone': userInfoModel.phone,
      'password': password,
      'token': getUserToken()
    });
  }

  Future<String> _saveDeviceToken() async {
    String _deviceToken = '';
    if (!GetPlatform.isWeb) {
      _deviceToken = (await FirebaseMessaging.instance.getToken())!;
    }
    if (_deviceToken != null) {
      print('--------Device Token---------- ' + _deviceToken);
    }
    return _deviceToken;
  }

  Future<Response> forgetPassword(String phone) async {
    return await apiClient
        .postData(AppConstants.FORGET_PASSWORD_URI, {"email": phone});
  }

  Future<Response> verifyToken(String email, String token) async {
    return await apiClient.postData(
        AppConstants.VERIFY_TOKEN_URI, {"email": email, "reset_token": token});
  }

  Future<Response> resetPassword(String resetToken, String email,
      String password, String confirmPassword) async {
    return await apiClient.postData(
      AppConstants.RESET_PASSWORD_URI,
      {
        "_method": "put",
        "email": email,
        "reset_token": resetToken,
        "password": password,
        "confirm_password": confirmPassword
      },
    );
  }

  Future<bool> saveUserToken(
    String token,
  ) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    log("saveUserToken ============================================>" + token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<bool> saveUserRefreshToken(
    String refreshtoken,
  ) async {
    log("saveRefreshToken ============================================>" +
        refreshtoken);
    return await sharedPreferences.setString(
        AppConstants.REFRESH_TOKEN, refreshtoken);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.DECODED_TOKEN);
    sharedPreferences.remove(AppConstants.USER_AVATAR_PATH);
    sharedPreferences.setStringList(AppConstants.CART_LIST, []);
    apiClient.token = null;
    apiClient.updateHeader(null);
    return true;
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_NUMBER, number);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_NUMBER);
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.USER_NUMBER) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<Response> updateToken() async {
    late String _deviceToken;
    if (GetPlatform.isIOS) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _deviceToken = await _saveDeviceToken();
      }
    } else {
      _deviceToken = await _saveDeviceToken();
    }

    return await apiClient.postData(AppConstants.TOKEN_URI,
        {"_method": "put", "token": getUserToken(), "fcm_token": _deviceToken});
  }

  // end of update token

  Future<http.StreamedResponse> updateProfile(
      ProfileModel userInfoModel, XFile data, String token) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${AppConstants.BASE_URL}${AppConstants.UPDATE_PROFILE_URI}'));
    request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
    if (GetPlatform.isMobile && data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile(
          'image', _file.readAsBytes().asStream(), _file.lengthSync(),
          filename: _file.path.split('/').last));
    }
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      '_method': 'put',
      'f_name': userInfoModel.fName!,
      'l_name': userInfoModel.lName!,
      'phone': userInfoModel.phone!,
      'token': getUserToken()
    });
    request.fields.addAll(_fields);
    print(request.fields);
    http.StreamedResponse response = await request.send();
    return response;
  }

  void saveEncodedToken({decodedToken}) {
    sharedPreferences.setString(AppConstants.DECODED_TOKEN, decodedToken);
  }

  String getDecodedToken() {
    return sharedPreferences.getString(AppConstants.DECODED_TOKEN) ?? "";
  }

  Future<Response> checkPhoneNumber({required String phoneNumber}) async {
    return apiClient.postData("", {"phone": phoneNumber});
  }

  Future<Response> resendOtp({required String phoneNumber}) async {
    return apiClient.postData("", {"phone": phoneNumber});
  }

  Future<Response> verifyPhoneNumber(
      {required String phoneNumber, required String otp}) async {
    return apiClient.postData("", {"phone": phoneNumber, "otp": otp});
  }
}
