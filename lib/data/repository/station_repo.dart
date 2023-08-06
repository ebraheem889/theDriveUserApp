import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/api/api_client.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:the_drive/util/app_constants.dart';

class StationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  StationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAllStations() async {
    return await apiClient.postData(AppConstants.ALL_STATIONS, json.encode({}));
  }

  Future<Response> getPickUpTypes() async {
    return await apiClient.postData(
        AppConstants.PICK_UP_TYPES,
        json.encode({
          "lovTypes": ["PICKUP"],
          "language": "en"
        }));
  }

  Future<Response> getAllmenus() async {
    return await apiClient.postData(AppConstants.ALL_MENUS, json.encode({}));
  }

  Future<Response> getMenuByIdAndPickUp({stationId, pickUp}) async {
    return await apiClient.postData(
        AppConstants.MENY_BU_ID,
        json.encode({
          "data": {
            "StationId": {
              "Op": "EQ",
              "Type": "string",
              "Value": "${stationId}"
            },
            "Pickup": {"Op": "EQ", "Type": "string", "Value": "${pickUp}"}
          }
        }));
  }

  Future<Response> getStationCategories({stationId}) async {
    return await apiClient.postData(
        AppConstants.STATION_CATEGORY,
        json.encode({
          "data": {
            "StationId": {
              "Op": "EQ",
              "Type": "string",
              "Value": "${stationId}"
            },
          }
        }));
  }
}
