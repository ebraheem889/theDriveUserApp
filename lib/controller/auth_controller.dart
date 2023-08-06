import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/verification_controller.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/profile_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/shared/enums.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/fire_base.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/app_constants.dart';
import 'package:the_drive/view/base/customPhoneNumber/phone_number.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/screen/home/home.dart';

import 'package:http/http.dart' as http;
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  final SharedPreferences sharedPreferences;
  AuthController({required this.authRepo, required this.sharedPreferences}) {}

// data member

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  Rx<Gender?> selectedGender = Rx(null);
  RxBool showPassword = false.obs;
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
  late String _signInPhoneNumber;
  late XFile _pickedFile;

  bool _isActiveRememberMe = false;
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
  String get signInPhoneNumber => _signInPhoneNumber;
  bool get isAuth => _isAuth;
  String get pinCode => _pinCode;
  XFile get pickedFile => _pickedFile;

  bool get isActiveRememberMe => _isActiveRememberMe;

  // end of getter functions

  void setphoneData({required PhoneNumber phone}) {
    _phoneNumber = phone.number;
    _counteryCode = phone.countryCode;

    concatPhoneAndCode(code: phone.countryCode, number: phone.number);
    update();
  }

  void concatPhoneAndCode({required String code, required String number}) {
    _signInPhoneNumber = code + number.substring(1);
  }

  Future<ResponseModel> login(
      {required String phone, required String password}) async {
    Dialogs.showLoading();

    Response response = await authRepo.login(phone, password);
    log("login response ===========================>" +
        response.body.toString());

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['data']["accessToken"]);
      authRepo.saveUserRefreshToken(response.body['data']["refreshToken"]);
      encodeUserToken(token: response.body['data']["accessToken"]);
      // await authRepo.updateToken();
      responseModel = ResponseModel(true, 'successful');
      Dialogs.dismiss();
    } else {
      ApiChecker.checkApi(response);
      Dialogs.dismiss();
      responseModel = ResponseModel(false, response.body["Message"]);
    }
    Dialogs.dismiss();
    return responseModel;
  } // end of login

  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  void logout() async {
    await authRepo.clearSharedData();
  }

  Future<void> getProfile() async {
    Response response = await authRepo.getProfileInfo();
    if (response.statusCode == 200) {
      _profileModel = ProfileModel.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  // end of get profile

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }
  // end of islogged

  Future<ResponseModel> forgetPassword(String phone) async {
    Dialogs.showLoading();
    Response response = await authRepo.forgetPassword(phone);

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    Dialogs.dismiss();
    return responseModel;
  }

  // end of forgetpassword

  Future<void> updateToken() async {
    await authRepo.updateToken();
  }

  // end of update token

  Future<bool> updateUserInfo(
      ProfileModel updateUserModel, String token) async {
    _isLoading = true;
    update();
    http.StreamedResponse response =
        await authRepo.updateProfile(updateUserModel, _pickedFile, token);
    _isLoading = false;
    bool _isSuccess;
    if (response.statusCode == 200) {
      _profileModel = updateUserModel;
      showCustomSnackBar('profile_updated_successfully'.tr, isError: false);
      _isSuccess = true;
    } else {
      ApiChecker.checkApi(Response(
          statusCode: response.statusCode,
          statusText: '${response.statusCode} ${response.reasonPhrase}'));
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }

  // end of update user profile

  void pickImage() async {
    _pickedFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    update();
  }

  Future<void> encodeUserToken({token}) async {
    Map<String, dynamic> payload = await Jwt.parseJwt(token);
    authRepo.saveEncodedToken(decodedToken: json.encode(payload));
  }

  String getDecodedUserId() {
    Map userData = json.decode(authRepo.getDecodedToken());
    return userData["${userData.keys.first}"];
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  Future<Response> resendOtp({required String phoneNumber}) async {
    _isLoading = true;
    update();
    Response response = await authRepo.resendOtp(phoneNumber: phoneNumber);
    if (response.statusCode == 200) {
      _isLoading = false;
    } else {
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<ResponseModel> phoneVerify(String phoneNumber, String otp) async {
    debugPrint('==number==> ' + phoneNumber + '==otp==>' + otp);
    _isLoading = true;
    update();
    Response response =
        await authRepo.verifyPhoneNumber(phoneNumber: phoneNumber, otp: otp);

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      print(response.body['message']);
      responseModel = ResponseModel(true, response.body["message"]);
      Get.find<VerificationController>().cancelTimer();
      showCustomSnackBar(responseModel.message, isError: false);
    } else {
      print(response.body['errors'][0]['message']);
      responseModel =
          ResponseModel(false, response.body['errors'][0]['message']);
      showCustomSnackBar(responseModel.message, isError: true);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
