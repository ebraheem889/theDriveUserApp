// ignore_for_file: file_names, avoid_print, duplicate_ignore

import 'dart:async';
import 'dart:convert';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:fawry_sdk/model/launch_merchant_model.dart';
import 'package:the_drive/controller/services/const/function.dart';

Future<bool> payWithFawry(
    {required String billItemId,
    required String billDescription,
    required int billQuantity,
    required double billPrice,
    required String customerName,
    required String customerEmail,
    required String customerMobile,
    required String merchantRefNum}) async {
  final completer = Completer<bool>();
  StreamSubscription<dynamic>? listener;
  //to get data from api depanding on id of order
  try {
    //   StreamSubscription<dynamic>? listener;
    //   final res = await Get.find<RemoteService>().post(Api.referenceNumber, {'requestId': orderId});
    //   final data = res.when(
    //     noConnection: () => null,
    //     failure: (message) => null,
    //     data: (data) => data,
    //   );
    /*
    {
  "customerName": "أحمد شحاته ",
  "customerMobile": "+201211593202",
  "customerEmail": "ahasdasd@gmail.com",
  "customerProfileId": "776a0851-94a9-4fef-801d-08dac6e7a1dc",
  "amount": 100,
  "items": [
    {
      "id": "6ebbc1aa-538b-4845-9705-7cb0034dc03d",
      "description": "الدفع مقابل الاستشارة",
      "price": 100,
      "quantity": 1
    }
  ],
  "language": "ar",
  "description": "الدفع مقابل الاستشارة",
  "merchantRefNum": "01e6da2b-480c-4749-994a-88efc22af3b7"
  }
    */

    final item = BillItem(
      itemId: billItemId,
      description: billDescription,
      quantity: billQuantity,
      price: billPrice,
    );
    final chargeItem = [item];

    final customer = LaunchCustomerModel(
      customerName: customerName,
      customerEmail: customerEmail,
      customerMobile: customerMobile,
    );
    //identity of app
    final marchant = LaunchMerchantModel(
      merchantCode: '+/IAAY2notjzedO0JVUgSg==',
      //id of order 10 digit GUID
      merchantRefNum: merchantRefNum,
      // merchantRefNum: 'a6409c5d-637a-4564-baf2-25e432812ecb',
      secureKey: '9dd2372c-ce14-42bf-b27f-3fa2a055d3aa',
    );
    final model = FawryLaunchModel(
      allow3DPayment: true,
      chargeItems: chargeItem,
      launchMerchantModel: marchant,
      launchCustomerModel: customer,
      skipLogin: true,
      skipReceipt: false,
    );
    listener = FawrySdk.instance.callbackResultStream().listen(
      (event) {
        // ignore: avoid_print
        print('=================$event');

        final firstJson = jsonDecode(event) as Map;
        if (firstJson.containsKey('data')) {
          final secondJson = jsonDecode(firstJson['data']) as Map;
          if (secondJson.containsKey('statusCode') && secondJson['secondJson'].toString() != '200') {
            completer.complete(false);
            listener?.cancel();
            return;
          } else {
            completer.complete(true);
            listener?.cancel();
            return;
          }
        } else if (firstJson.containsKey('message')) {
          completer.complete(false);
          return;
        } else {
          completer.complete(false);
          listener?.cancel();
          return;
          // final secondJson = jsonDecode(firstJson['message']) as Map;
          // if (secondJson.containsKey('statusCode') && secondJson['secondJson'].toString() != '200') {
          //   completer.complete(false);
          //   listener?.cancel();
          //   return;
          // } else {
          //   completer.complete(true);
          //   listener?.cancel();
          //   return;
          // }
        }
        /*
        {"data":"{\"customerMail\":\"ah.kkuhyvv@gmail.com\",\"customerMobile\":\"+201222209059\",\"expirationTime\":\"1671964788137\",\"fawryFees\":0.0,\"merchantRefNumber\":\"1491524a-389b-41e9-ad83-02c84bbb8ca0\",\"orderAmount\":\"200.0\",\"orderStatus\":\"UNPAID\",\"paymentAmount\":\"200.0\",\"paymentMethod\":\"PayAtFawry\",\"referenceNumber\":\"7108624912\",\"shippingFees\":0.0,\"signature\":\"035a5161362fe3ded0dbcf4ee2ec19abafee6f25cd78617b2486e1741e922477\",\"taxes\":0.0,\"statusCode\":200,\"statusDescription\":\"العملية تمت بنجاح .\",\"type\":\"ChargeResponse\"}","message":"success","status":"102"}
        {"message":"{\"statusCode\":99963,\"statusDescription\":\"عذرًا لقد حدث خطأ ما يُرجى إعادة المحاولة لاحقًا\"}","status":"101"}
        {"data":"{\"statusCode\":9949,\"statusDescription\":\"تم تنفيذ هذا الطلب من قبل  برجاء تغيير قيمه merchantRefNum انت المحاوله مجداا\"}","message":"failure","status":"102"}
        */
      },
    );
    // ignore: unused_local_variable
    final l = FawrySdk.instance.init(
      launchModel: model,
      baseURL: 'https://atfawry.fawrystaging.com/',
      // baseURL: 'https://www.atfawry.com/',
      lang: localNotifair.value == "en" ? FawrySdk.LANGUAGE_ENGLISH : FawrySdk.LANGUAGE_ARABIC,
    );

    // ignore: avoid_catches_without_on_clauses
  } catch (_) {
    print('===================_');
    completer.complete(false);
  }
  return completer.future;
}
