import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/body/user_body.dart';
import 'package:the_drive/util/app_constants.dart';

class RegisterRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  RegisterRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registerClient(UserBody userBody) async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI4NTE4YWI3Ny1mMzY5LTQ2NzYtODQzYy1lMTE3OTNhYjAxZDQiLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMzM0MzExZWMtMTY0MS00OWQ5LWJhMTAtYjJlYzI4NTM4NjRkL3YyLjAiLCJpYXQiOjE2NzExMTU1ODYsIm5iZiI6MTY3MTExNTU4NiwiZXhwIjoxNjcxMTIwMDUzLCJhaW8iOiJBVFFBeS84VEFBQUFMZllKeEVUOXMzaGYwa2wrUDZSd2plbi9VZnd3S1lGR0V6QllzYVBnTGErQ3U2Qm1RelF6TWhnZy9LampOWmJXIiwiYXpwIjoiODUxOGFiNzctZjM2OS00Njc2LTg0M2MtZTExNzkzYWIwMWQ0IiwiYXpwYWNyIjoiMCIsIm5hbWUiOiJDTVMgVGVzdCBVc2VyIiwib2lkIjoiZTQ4ZTdiYmYtMjIyYy00YWI2LTk4ZDktYWNhZDYxN2FkNTUwIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiY21zX3Rlc3RAc3BlcmlkaWFubGFicy5vbm1pY3Jvc29mdC5jb20iLCJyaCI6IjAuQVQ0QTdCRkRNMEVXMlVtNkVMTHNLRk9HVFhlckdJVnA4M1pHaER6aEY1T3JBZFEtQUY0LiIsInNjcCI6ImFjY2Vzc19hc191c2VyIiwic3ViIjoienZzSkJLZlNMb1pfMFpHUkdBcml2bkVLanhNQmdyWklFYnBTRUFKbXZnMCIsInRpZCI6IjMzNDMxMWVjLTE2NDEtNDlkOS1iYTEwLWIyZWMyODUzODY0ZCIsInV0aSI6IjJhMXdicDYzNVVhelRGangtVFpjQVEiLCJ2ZXIiOiIyLjAifQ.GB4XhRzFsAxSlrf9QRgtwJYTMGAQYDIkzv6HVQq6bbO2-wJV9yZDDXmmsCcLziq2nuGXs2QpyWRZERAvOHhxoEDtgqdkq8neMCqTPOaRLTnvRRf5Fo6e38Y-30lsHs7zMnkk5TZgNZ_xsf5E5PDSAUEc7Eyq1Evus0Ayr15FIeNGZ9TcfB-G3gee_BI5oXDRm1ovXDW6ome8meFG800VGrzz2bbbJCYnD11IiIxbavB6AgD-px25uvxlqWR5awd4h_9zqzCTW3aLbtV5kFEHg9YxJU5psGt1Yvq8-uAACV7uhQQmxvORcRHXZhNRapkEgGMUkPZ_tSJvIhwfvP5daA',
      'Content-Type': 'application/json'
    };

    return await apiClient.postData(
        AppConstants.REGISTER_URI,
        json.encode({
          "firstName": "${userBody.firstName}",
          "middleName": null,
          "lastName": "${userBody.firstName}",
          "userType": "USER",
          "email": "${userBody.email}",
          "password": "${userBody.password}",
          "managerId": null,
          "status": "A",
          "workPhoneNum": null,
          "homePhoneNum": null,
          "cellPhoneNum": "${userBody.cellPhoneNum}",
          "primaryRoleId": null,
          "userId": "${userBody.email}",
          "userAttribute": "string",
          "dateOfBirth": "${userBody.dateOfBirth!.trim()}T13:45:20.856Z",
          "gender": "${userBody.gender!.trim().substring(0, 1)}",
          "termsConditionsAcceptance": true
        }),
        headers: headers);
  } // end of register

  Future<bool> saveUserToken(
    String token,
  ) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  } // end of user save token

  Future<Response> forgetPassword({phone}) async {
    Map<String, String> _body = Map();
    // to be deleted
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI4NTE4YWI3Ny1mMzY5LTQ2NzYtODQzYy1lMTE3OTNhYjAxZDQiLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMzM0MzExZWMtMTY0MS00OWQ5LWJhMTAtYjJlYzI4NTM4NjRkL3YyLjAiLCJpYXQiOjE2NzExMTU1ODYsIm5iZiI6MTY3MTExNTU4NiwiZXhwIjoxNjcxMTIwMDUzLCJhaW8iOiJBVFFBeS84VEFBQUFMZllKeEVUOXMzaGYwa2wrUDZSd2plbi9VZnd3S1lGR0V6QllzYVBnTGErQ3U2Qm1RelF6TWhnZy9LampOWmJXIiwiYXpwIjoiODUxOGFiNzctZjM2OS00Njc2LTg0M2MtZTExNzkzYWIwMWQ0IiwiYXpwYWNyIjoiMCIsIm5hbWUiOiJDTVMgVGVzdCBVc2VyIiwib2lkIjoiZTQ4ZTdiYmYtMjIyYy00YWI2LTk4ZDktYWNhZDYxN2FkNTUwIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiY21zX3Rlc3RAc3BlcmlkaWFubGFicy5vbm1pY3Jvc29mdC5jb20iLCJyaCI6IjAuQVQ0QTdCRkRNMEVXMlVtNkVMTHNLRk9HVFhlckdJVnA4M1pHaER6aEY1T3JBZFEtQUY0LiIsInNjcCI6ImFjY2Vzc19hc191c2VyIiwic3ViIjoienZzSkJLZlNMb1pfMFpHUkdBcml2bkVLanhNQmdyWklFYnBTRUFKbXZnMCIsInRpZCI6IjMzNDMxMWVjLTE2NDEtNDlkOS1iYTEwLWIyZWMyODUzODY0ZCIsInV0aSI6IjJhMXdicDYzNVVhelRGangtVFpjQVEiLCJ2ZXIiOiIyLjAifQ.GB4XhRzFsAxSlrf9QRgtwJYTMGAQYDIkzv6HVQq6bbO2-wJV9yZDDXmmsCcLziq2nuGXs2QpyWRZERAvOHhxoEDtgqdkq8neMCqTPOaRLTnvRRf5Fo6e38Y-30lsHs7zMnkk5TZgNZ_xsf5E5PDSAUEc7Eyq1Evus0Ayr15FIeNGZ9TcfB-G3gee_BI5oXDRm1ovXDW6ome8meFG800VGrzz2bbbJCYnD11IiIxbavB6AgD-px25uvxlqWR5awd4h_9zqzCTW3aLbtV5kFEHg9YxJU5psGt1Yvq8-uAACV7uhQQmxvORcRHXZhNRapkEgGMUkPZ_tSJvIhwfvP5daA'
    };
    _body.addAll(<String, String>{'email': phone});
    return await apiClient.postMultipartData(
        AppConstants.FORGET_PASSWORD_URI, _body, [],
        headers: headers);
  } // end of forget password

  Future<Response> changePassword(
      {required String phone,
      required String newPassword,
      required String confirmPassword}) async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI4NTE4YWI3Ny1mMzY5LTQ2NzYtODQzYy1lMTE3OTNhYjAxZDQiLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMzM0MzExZWMtMTY0MS00OWQ5LWJhMTAtYjJlYzI4NTM4NjRkL3YyLjAiLCJpYXQiOjE2NzExMTU1ODYsIm5iZiI6MTY3MTExNTU4NiwiZXhwIjoxNjcxMTIwMDUzLCJhaW8iOiJBVFFBeS84VEFBQUFMZllKeEVUOXMzaGYwa2wrUDZSd2plbi9VZnd3S1lGR0V6QllzYVBnTGErQ3U2Qm1RelF6TWhnZy9LampOWmJXIiwiYXpwIjoiODUxOGFiNzctZjM2OS00Njc2LTg0M2MtZTExNzkzYWIwMWQ0IiwiYXpwYWNyIjoiMCIsIm5hbWUiOiJDTVMgVGVzdCBVc2VyIiwib2lkIjoiZTQ4ZTdiYmYtMjIyYy00YWI2LTk4ZDktYWNhZDYxN2FkNTUwIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiY21zX3Rlc3RAc3BlcmlkaWFubGFicy5vbm1pY3Jvc29mdC5jb20iLCJyaCI6IjAuQVQ0QTdCRkRNMEVXMlVtNkVMTHNLRk9HVFhlckdJVnA4M1pHaER6aEY1T3JBZFEtQUY0LiIsInNjcCI6ImFjY2Vzc19hc191c2VyIiwic3ViIjoienZzSkJLZlNMb1pfMFpHUkdBcml2bkVLanhNQmdyWklFYnBTRUFKbXZnMCIsInRpZCI6IjMzNDMxMWVjLTE2NDEtNDlkOS1iYTEwLWIyZWMyODUzODY0ZCIsInV0aSI6IjJhMXdicDYzNVVhelRGangtVFpjQVEiLCJ2ZXIiOiIyLjAifQ.GB4XhRzFsAxSlrf9QRgtwJYTMGAQYDIkzv6HVQq6bbO2-wJV9yZDDXmmsCcLziq2nuGXs2QpyWRZERAvOHhxoEDtgqdkq8neMCqTPOaRLTnvRRf5Fo6e38Y-30lsHs7zMnkk5TZgNZ_xsf5E5PDSAUEc7Eyq1Evus0Ayr15FIeNGZ9TcfB-G3gee_BI5oXDRm1ovXDW6ome8meFG800VGrzz2bbbJCYnD11IiIxbavB6AgD-px25uvxlqWR5awd4h_9zqzCTW3aLbtV5kFEHg9YxJU5psGt1Yvq8-uAACV7uhQQmxvORcRHXZhNRapkEgGMUkPZ_tSJvIhwfvP5daA',
      'Content-Type': 'application/json'
    };
    return await apiClient.postData(
        AppConstants.RESET_PASSWORD_URI,
        json.encode({
          "username": "${phone}",
          "oldPassword": "${newPassword}",
          "newPassword": "${confirmPassword}"
        }),
        headers: headers);
  } // end of change password
}
