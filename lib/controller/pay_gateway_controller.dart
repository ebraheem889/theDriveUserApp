import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/model/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/body/fawry_model.dart';
import 'package:the_drive/data/model/response/add_on_category.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/category_add_on_repo.dart';
import 'package:the_drive/data/repository/favorit_repo.dart';
import 'package:the_drive/data/repository/payment_repo.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:uuid/uuid.dart';

import '../view/base/custom_snack_bar.dart';

class PaymentController extends GetxController implements GetxService {
  final PaymentRepo paymentRepo;
  PaymentController({required this.paymentRepo});

  final _completer = Completer<bool>();
  StreamSubscription<dynamic>? _listener;

  // void fawryPay({fawryModel}) {
  //   try {
  //     _listener = FawrySdk.instance.callbackResultStream().listen(
  //       (event) {
  //         final firstJson = jsonDecode(event) as Map;

  //         if (firstJson.containsKey('data')) {
  //           final secondJson = jsonDecode(firstJson['data']) as Map;

  //           if (secondJson.containsKey('statusCode') &&
  //               secondJson['secondJson'].toString() != '200') {
  //             _completer.complete(false);
  //             _listener?.cancel();
  //             return;
  //           } else {
  //             _completer.complete(true);
  //             _listener?.cancel();
  //             return;
  //           }
  //         } else if (firstJson.containsKey('message')) {
  //           _completer.complete(false);
  //           return;
  //         } else {
  //           _completer.complete(false);
  //           _listener?.cancel();
  //           return;
  //         }
  //       },
  //     );
  //     paymentRepo.payWithFawry(fawryModel: fawryModel);
  //   } catch (e) {
  //     log("fawry erorr====================>" + e.toString());
  //   }
  // }

  Future<void> fawryPay({required FawryModel fawryModel}) async {
    try {
      FawrySdk.instance.callbackResultStream().listen((event) {
        ResponseStatus response = ResponseStatus.fromJson(jsonDecode(event));
        switch (response.status) {
          case FawrySdk.RESPONSE_SUCCESS:
            {
              // go to home page
              Future.delayed(Duration(seconds: 1), () {
                Get.to(
                  RouteHelper.home,
                );
                showCustomSnackBar(response.message, isError: false);
              });

              // //Success status
              // log('Message : ${response.message}');
              // //Success json response
              // log('Json Response : ${response.data}');
            }
            break;
          case FawrySdk.RESPONSE_ERROR:
            {
              log('Error : ${response.message}');
            }
            break;
          case FawrySdk.RESPONSE_PAYMENT_COMPLETED:
            {
              log('Payment Completed : ${response.message} , ${response.data}');
            }
            break;
        }
      });

      await paymentRepo.payWithFawry(fawryModel: fawryModel);
    } catch (e) {
      log("fawry erorr====================>" + e.toString());
    }
  }

  String generateUuid() {
    return Uuid().v4();
  }
}
