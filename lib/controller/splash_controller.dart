import 'package:intl/intl.dart';
import 'package:the_drive/data/api/api_checker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:the_drive/data/repository/splah_repo.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  DateTime _currentTime = DateTime.now();
  bool _firstTimeConnectionCheck = true;

  DateTime get currentTime => _currentTime;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }

  bool showIntro() {
    return splashRepo.showIntro();
  }

  void setIntro(bool intro) {
    splashRepo.setIntro(intro);
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }
}
