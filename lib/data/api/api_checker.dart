import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/token_handler_controller.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/app_constants.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';

class ApiChecker {
  static void checkApi(Response response) async {
    if (response.statusCode == 401) {
      //delete shared data
      // Get.find<AuthController>().clearSharedData();
      // Get.offAllNamed(RouteHelper.getLoginPage());

      _handleUSerCase();
      showCustomSnackBar(response.statusText!);
    } else if (response.statusCode == 500) {
      _handleUSerCase();
      showCustomSnackBar(response.body["Message"]);
    } else {
      _handleUSerCase();
      showCustomSnackBar(response.statusText!);
    }
  }

  static void _handleUSerCase() async {
    if (Get.find<TokenHandlerController>().hasToken()) {
      var _isexpired =
          await Get.find<TokenHandlerController>().isTokenExpired();
      log("token expired ========================>$_isexpired");
      if (_isexpired) {
        await Get.find<TokenHandlerController>().refreshToken();
      }
    }
  }
}
