import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/body/user_body.dart';
import 'package:the_drive/util/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  UserRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getUserInfo({userid}) async {
    return await apiClient.postData(
        AppConstants.USER_INFO_URI,
        json.encode({
          "data": {
            "id": {"Op": "EQ", "Type": "string", "Value": "$userid"}
          }
        }));
  }

  Future<Response> updateProfile(UserBody userInfoModel) async {
    return await apiClient.postData(
        AppConstants.UPDATE_PROFILE_URI,
        json.encode({
          "id": "${userInfoModel.id}",
          "firstName": "${userInfoModel.firstName}",
          "middleName": "",
          "lastName": "${userInfoModel.lastName}",
          "userType": null,
          "email": "${userInfoModel.email}",
          "managerId": null,
          "status": "A",
          "workPhoneNum": "",
          "homePhoneNum": "",
          "cellPhoneNum": "${userInfoModel.cellPhoneNum}",
          "userId": "${userInfoModel.email}",
          "userAttribute": "string",
          "dateOfBirth": "${userInfoModel.dateOfBirth}",
          "gender": "${userInfoModel.gender}"
        }));
  }

  Future<Response> deleteUser() async {
    return await apiClient.deleteData(AppConstants.CUSTOMER_REMOVE);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  Future<Response> changePassword(
      {required String phone,
      required String oldPassword,
      required String newPassword}) async {
    return await apiClient.postData(
      AppConstants.RESET_PASSWORD_URI,
      json.encode({
        "username": "${phone}",
        "oldPassword": "${oldPassword}",
        "newPassword": "${newPassword}"
      }),
    );
  } // end of change password

  Future<bool> updateUserAvatar(Map<String, dynamic> avatarData) async {
    return await sharedPreferences.setString(
        AppConstants.USER_AVATAR_PATH, json.encode(avatarData));
  }

  Future<String> getUserAvatar() async {
    return await sharedPreferences.getString(AppConstants.USER_AVATAR_PATH) ??
        "{}";
  }
}
