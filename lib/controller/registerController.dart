import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/body/user_body.dart';
import 'package:the_drive/data/model/response/profile_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/registerRepo.dart';
import 'package:the_drive/data/shared/enums.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/fire_base.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/app_constants.dart';
import 'package:the_drive/view/base/customPhoneNumber/phone_number.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/screen/home/home.dart';

import '../data/repository/auth_repo.dart';

class RegisterController extends GetxController implements GetxService {
  final RegisterRepo registerRepo;

  final SharedPreferences sharedPreferences;
  RegisterController({
    required this.registerRepo,
    required this.sharedPreferences,
  }) {}

// data member

  final checkTermsAndPrivacy = false.obs;
  late String _counteryCode;
  bool _isLoading = false;
  bool _isAuth = false;
  RxBool _isOtpValid = true.obs;
  late String _pinCode;
  late ProfileModel _profileModel;
  late String _verificationID;
  int _gustID = 0;
  String _smsOTP = '';
  late String _phoneNumber;
  late String _signUpPhoneNumber;
  RxBool get isOtpValid => _isOtpValid;

  //end of data member

  // getter functions
  bool get isLoading => _isLoading;
  ProfileModel get profileModel => _profileModel;
  String get verificationId => _verificationID;
  int get guestId => _gustID;
  String get smsOTP => _smsOTP;
  String get phoneNumber => _phoneNumber;
  String get countryCode => _counteryCode;
  String get signUpPhoneNumber => _signUpPhoneNumber;
  bool get isAuth => _isAuth;
  String get pinCode => _pinCode;

  // end of getter functions

  void setPincode({required pin}) {
    _pinCode = pin;
    update();
  }

  void setphoneData({required PhoneNumber phone}) {
    _phoneNumber = phone.number;
    _counteryCode = phone.countryCode;

    concatPhoneAndCode(code: phone.countryCode, number: phone.number);
    update();
  }

  void concatPhoneAndCode({required String code, required String number}) {
    _signUpPhoneNumber = code + number.substring(1);
  }

  Future<void> register({required UserBody userBody}) async {
    Dialogs.showLoading();

    Response response = await registerRepo.registerClient(userBody);

    log("register response ===============>" + response.body.toString());

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      final otp = await FirebaseHelper.verifyPhoneNumber(_signUpPhoneNumber);
      if (otp != null) {
        _verificationID = otp;
        Dialogs.dismiss();
        Get.toNamed(
            RouteHelper.getOtpScreen(destinationScreeen: RouteHelper.signIn));
      }
    } else {
      Dialogs.dismiss();
      ApiChecker.checkApi(response);
    }
  }

  Future<void> sendPinCode() async {
    var code = await FirebaseHelper.verifyPhoneNumber(_signUpPhoneNumber);
  }

  Future<void> resendPinCode() async {
    sendPinCode();
  }

  Future<ResponseModel> checkPinCode() async {
    Dialogs.showLoading();
    var canRoute = false;
    ResponseModel responseModel;
    canRoute = await FirebaseHelper.signInWithCredential(
        verificationId: _verificationID, smsCode: _pinCode);

    Dialogs.dismiss();

    _isOtpValid.value = canRoute;
    log("canRoute==============================>" + canRoute.toString());
    if (canRoute) {
      return responseModel = ResponseModel(true, "success");
    } else {
      return responseModel = ResponseModel(false, "fail");
    }
  }

  Future<ResponseModel> forgetPassword() async {
    Dialogs.showLoading();
    Response response =
        await registerRepo.forgetPassword(phone: _signUpPhoneNumber);

    log("forget response ===================>" + response.toString());
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      final otp = await FirebaseHelper.verifyPhoneNumber(_signUpPhoneNumber);

      responseModel = ResponseModel(true, 'successful');
      if (otp != null) {
        _verificationID = otp;
        responseModel = ResponseModel(true, 'successful');
      } else {
        responseModel = ResponseModel(false, 'faile');
      }
    } else {
      responseModel = ResponseModel(false, response.body["Message"]);
    }
    Dialogs.dismiss();
    return responseModel;
  }

  Future<ResponseModel> changePassword({newPassword, confirmPassword}) async {
    Dialogs.showLoading();
    Response response = await registerRepo.changePassword(
        phone: _signUpPhoneNumber,
        newPassword: newPassword,
        confirmPassword: confirmPassword);

    log("changePassword response====================>" +
        response.body.toString());

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'successful');
    } else {
      responseModel = ResponseModel(false, response.body["Message"]);
    }
    Dialogs.dismiss();
    return responseModel;
  } // end of change password

  Future<bool> signInWithCredential({required String smsCode}) async {
    // _isLoading = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationID, smsCode: smsCode);
      var credinti =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await sharedPreferences.setString(
          AppConstants.LOGGED_USER_ID, credinti.user!.uid.toString());

      Get.to(() => HomeScreen());
      return true;
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print("signInWithCredential error $e");
      return false;
    }
  }
}
