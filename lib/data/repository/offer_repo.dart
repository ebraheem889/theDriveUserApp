import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/util/app_constants.dart';

class OfferRepo {
  late ApiClient _apiClient;

  OfferRepo({required ApiClient apiClient}) {
    _apiClient = apiClient;
  }

  Future<Response> getAllOffers() async {
    return await _apiClient.postData(
        AppConstants.ALL_OFFER_URI, json.encode({}));
  }

  Future<Response> getOfferByID({required String offerId}) async {
    return await _apiClient.postData(
        AppConstants.ALL_OFFER_URI, json.encode({}));
  }
}
