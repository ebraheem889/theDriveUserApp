import 'package:connectivity/connectivity.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/splash_controller.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/dimensions.dart';
import 'package:the_drive/util/images.dart';
import 'package:the_drive/util/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    bool _firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ? 'no_connection' : 'connected',
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          _route();
        }
      }
      _firstTime = false;
    });

    Get.find<SplashController>().initSharedData();
    _route();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() {
    Timer(Duration(seconds: 1), () async {
      if (Get.find<AuthController>().isLoggedIn()) {
        await Get.find<AuthController>().getProfile();
        Get.offNamed(RouteHelper.getHomePage());
      } else {
        Get.offNamed(RouteHelper.getSplashRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(Images.logo, width: 220),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Image.asset(Images.logo_name, width: 180),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Text('suffix_name'.tr,
                style: robotoMedium, textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}
