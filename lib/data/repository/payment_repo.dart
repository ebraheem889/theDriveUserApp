import 'dart:async';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:fawry_sdk/model/launch_merchant_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/body/fawry_model.dart';
import 'package:the_drive/data/model/body/fawry_objects.dart';
import 'package:the_drive/util/app_constants.dart';

class PaymentRepo extends GetxService {
  final ApiClient apiClient;
  PaymentRepo({required this.apiClient});

  late FawryData _fawryData;

  Future<void> payWithFawry({required FawryModel fawryModel}) async {
    await initFawryData(fawryModel: fawryModel);

    final processFawrySDK = FawrySdk.instance.init(
      launchModel: _fawryData.model,
      baseURL: AppConstants.FAWRY_BASE_URL,
      lang: Get.find<LocalizationController>().isLtr
          ? FawrySdk.LANGUAGE_ENGLISH
          : FawrySdk.LANGUAGE_ARABIC,
    );
  }

  Future<void> initFawryData({required FawryModel fawryModel}) async {
    _fawryData = FawryData(
        model: FawryLaunchModel(
      allow3DPayment: true,
      chargeItems: [
        BillItem(
          itemId: fawryModel.billItemId,
          description: fawryModel.billDescription,
          quantity: fawryModel.billQuantity,
          price: fawryModel.billPrice,
        )
      ],
      launchMerchantModel: LaunchMerchantModel(
        merchantCode: AppConstants.Merchant_Code,
        //id of order 10 digit GUID
        merchantRefNum: fawryModel.merchantRefNum,
        // merchantRefNum: 'a6409c5d-637a-4564-baf2-25e432812ecb',
        secureKey: AppConstants.Security_Key,
      ),
      launchCustomerModel: LaunchCustomerModel(
        customerName: fawryModel.customerName,
        customerEmail: fawryModel.customerEmail,
        customerMobile: fawryModel.customerMobile,
      ),
      skipLogin: true,
      skipReceipt: false,
    ));
  }
}
