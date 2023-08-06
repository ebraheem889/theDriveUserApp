// ignore_for_file: avoid_print, file_names

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/splash_controller.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:video_player/video_player.dart';

import 'widget/vedio_widget.dart';

class OnBoardingPageScreen extends StatefulWidget {
  const OnBoardingPageScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingPageScreen> createState() => _OnBoardingPageScreenState();
}

class _OnBoardingPageScreenState extends State<OnBoardingPageScreen> {
  VideoPlayerController? _controller;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  late bool _isLogged;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..addListener(() {
        // setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) {
        _controller!.play();
        setState(() {});
      }).catchError((err) {
        print(err);
      });

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
    _isLogged = Get.find<AuthController>().isLoggedIn();
    _route();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    _onConnectivityChanged.cancel();
    super.dispose();
  }

  void _route() {
    if (!Get.find<AuthController>().isLoggedIn()) {
    } else {
      Timer(Duration(seconds: 3), () async {
        // await Get.find<AuthController>().getProfile();
        Get.offNamed(RouteHelper.getHomePage());
      });
    }
  }

  Widget _videoViwer() {
    if (_controller != null && _controller!.value.isInitialized) {
      return VideoWidget(controller: _controller, isLogged: _isLogged);
    } else {
      return SizedBox(
        height: context.height,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoViwer(),
    );
  }
}
