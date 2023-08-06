import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/add_on_controller.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/banner_controller.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/categoryAddOn_Controller.dart';
import 'package:the_drive/controller/check_in_controller.dart';
import 'package:the_drive/controller/favorit_controller.dart';
import 'package:the_drive/controller/home_controller.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/new_in_menu_controller.dart';
import 'package:the_drive/controller/notification_controller.dart';
import 'package:the_drive/controller/offer_controller.dart';
import 'package:the_drive/controller/pay_gateway_controller.dart';
import 'package:the_drive/controller/qr_code_scanner_controller.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/splash_controller.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/controller/token_handler_controller.dart';
import 'package:the_drive/controller/user_controller.dart';
import 'package:the_drive/controller/verification_controller.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/response/language_model.dart';
import 'package:the_drive/data/repository/add_on_repo.dart';
import 'package:the_drive/data/repository/auth_repo.dart';
import 'package:the_drive/data/repository/banner_repo.dart';
import 'package:the_drive/data/repository/cart_repo.dart';
import 'package:the_drive/data/repository/category_add_on_repo.dart';
import 'package:the_drive/data/repository/check_in_repo.dart';
import 'package:the_drive/data/repository/favorit_repo.dart';
import 'package:the_drive/data/repository/home_repo.dart';
import 'package:the_drive/data/repository/languag_repo.dart';
import 'package:the_drive/data/repository/new_in_menu_repo.dart';
import 'package:the_drive/data/repository/notification_repo.dart';
import 'package:the_drive/data/repository/offer_repo.dart';
import 'package:the_drive/data/repository/payment_repo.dart';
import 'package:the_drive/data/repository/registerRepo.dart';
import 'package:the_drive/data/repository/splah_repo.dart';
import 'package:the_drive/data/repository/station_repo.dart';
import 'package:the_drive/data/repository/token_handler_repo.dart';
import 'package:the_drive/data/repository/user_repo.dart';
import 'package:the_drive/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

//===================================================================================> repository
  Get.lazyPut(() => LanguageRepo());
  // end of language repo
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of auth repo
  Get.lazyPut(
      () => RegisterRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of register repo

  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  // endof cart repo

  Get.lazyPut(
      () => UserRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of user repo

  Get.lazyPut(() =>
      NotificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of notification repo
  Get.lazyPut(
      () => SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of splash repo
  Get.lazyPut(
      () => HomeRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of home repo

  Get.lazyPut(
      () => StationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of station repo

  Get.lazyPut(() =>
      CategoryAddOnRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of categories repo

  Get.lazyPut(() => FavoritRepo(sharedPreferences: Get.find()));
  // end of favorit repo

  Get.lazyPut(() => AddOnRepo(apiClient: Get.find()));
  // end of favorit AddOnRepo

  Get.lazyPut(() => CheckInRepo(apiClient: Get.find()));
  // end of favorit CheckInRepo

  Get.lazyPut(() => OfferRepo(apiClient: Get.find()));
  // end of favorit OfferRepo

  Get.lazyPut(() => NewInMenueRepo(apiClient: Get.find()));
  // end of favorit NewInMenueRepo

  Get.lazyPut(() => BannerRepo(apiClient: Get.find()));
  // end of favorit BannerRepo

  Get.lazyPut(() => PaymentRepo(apiClient: Get.find()));
  // end of favorit PaymentRepo

  Get.lazyPut(() =>
      TokenHandlerRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // end of favorit PaymentRepo
  //===============================================================================>  Controller

  Get.lazyPut(() => SplashController(
        splashRepo: Get.find(),
      ));
  // end  of splash controller
  Get.lazyPut(() =>
      AuthController(authRepo: Get.find(), sharedPreferences: Get.find()));
  // end of auth controller
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  // end of cart controller
  Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));
  // end of notification controller
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  // end of user controller
  Get.lazyPut(() => RegisterController(
      registerRepo: Get.find(), sharedPreferences: Get.find()));
  // end of register controller
  Get.lazyPut(() =>
      HomeController(homeRepo: Get.find(), sharedPreferences: Get.find()));
  // end of home controller
  Get.lazyPut(() => LocalizationController(
      sharedPreferences: sharedPreferences, apiClient: Get.find()));
  // end of localization controrller

  Get.lazyPut(() => StationController(stationRepo: Get.find()));
  // end of station controller

  Get.lazyPut(() => CategoryAddOnController(categoryAddOnRepo: Get.find()));
  // end of station controller

  Get.lazyPut(() => FavoritController(favoritRepo: Get.find()));
  // end of fav controller

  Get.lazyPut(() => AddOnController(addOnRepo: Get.find()));
  // end of fav controller

  Get.lazyPut(() => CheckInController(checkInRepo: Get.find()));
  // end of fav controller

  Get.lazyPut(() => OfferController(offerRepo: Get.find()));
  // end of fav OfferController
  Get.lazyPut(() => NewInMenuController(newinMenuRepo: Get.find()));
  // end of fav NewInMenuController
  Get.lazyPut(() => BannerController(bannerRepo: Get.find()));

  Get.lazyPut(() => VerificationController(authRepo: Get.find()));
  // end of fav BannerController

  Get.lazyPut(() => PaymentController(paymentRepo: Get.find()));
  // end of fav PaymentController

  Get.lazyPut(() => QrCodeScannerController);

  Get.lazyPut(() => TokenHandlerController(
      tokenHandlerRepo: Get.find(), sharedPreferences: Get.find()));
  // end of fav PaymentController
  //===================================================================>  Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
