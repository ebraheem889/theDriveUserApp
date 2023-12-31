import 'dart:async';

import 'package:get/get.dart';
import 'package:the_drive/data/repository/auth_repo.dart';

class VerificationController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  VerificationController({required this.authRepo});
  int maxSecond = 70;
  late Timer _timer;
  bool _visibility = false;
  bool get visibility => _visibility;
  Timer get timer => _timer;

  void cancelTimer() {
    _timer.cancel();
    // update();
  }

  setVisibility(bool b) {
    _visibility = b;
    maxSecond = 30;
    update();
  }

  // otp
  late String _otp;
  String get otp => _otp;
  setOtp(String pin) {
    print('set is working..... $pin');
    _otp = pin;
    print('is set otp' + _otp.toString());
    //update();
  }

  startTimer() {
    maxSecond = 30;
    update();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (maxSecond > 0) {
        maxSecond = maxSecond - 1;
        print(maxSecond);
        _visibility = false;
      } else {
        _visibility = true;
        _timer.cancel();
      }
      update();
    });
  }
}
