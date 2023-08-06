import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/body/user_body.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/model/response/user_info_model.dart';
import 'package:the_drive/data/repository/user_repo.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/images.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  UserBody? _userInfoModel;
  late List<String> _avatars;
  bool _isProfileDataLoaded = false;

  // user default avatar
  late String _avatarPath = Images.MAIN_AVATAR;

  UserInfoData? _userInfoData;
  late XFile _pickedFile;
  bool _isLoading = false;
  late int _selectedAvatarIndex = 0;

  UserBody? get userInfoModel => _userInfoModel;
  UserInfoData? get userInfoData => _userInfoData;
  XFile get pickedFile => _pickedFile;
  bool get isLoading => _isLoading;
  List<String> get avatars => _avatars;
  String get avatarPath => _avatarPath;
  int get selectedAvatarIndex => _selectedAvatarIndex;
  bool get isProfileDataLoadedBefore => _isProfileDataLoaded;

  void getAvatars() {
    _avatars = [
      Images.MAIN_AVATAR,
      Images.AVATAR1,
      Images.AVATAR2,
      Images.AVATAR3,
      Images.AVATAR4,
      Images.AVATAR5,
      Images.AVATAR6,
      Images.AVATAR7,
    ];
  }

// start refactoring
  Future<void> getUserData() async {
    log("getUserData request======================>");
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    getAvatarAndIniIndex();
    getAvatars();
    Response response = await userRepo.getUserInfo(userid: getUserID());
    if (response.statusCode == 200) {
      _userInfoData = UserInfoData.fromJson(response.body["items"][0]);
      _isProfileDataLoaded = true;
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

// end  refactoring
  Future<ResponseModel> updateUserInfo(UserBody updateUserModel) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await userRepo.updateProfile(updateUserModel);

    _isLoading = false;
    if (response.statusCode == 200) {
      _userInfoModel = updateUserModel;
      _responseModel = ResponseModel(true, response.bodyString!);
      getUserData();
      print(response.bodyString);
    } else {
      ApiChecker.checkApi(response);
      _responseModel = ResponseModel(false, response.statusText!);
      print(response.statusText);
    }
    update();
    return _responseModel;
  } // end of update user info

  void pickImage() async {
    _pickedFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    update();
  } // end of change password

  Future removeUser() async {
    _isLoading = true;
    update();
    Response response = await userRepo.deleteUser();
    _isLoading = false;
    if (response.statusCode == 200) {
      showCustomSnackBar('your_account_remove_successfully'.tr);
      // Get.find<AuthController>().clearSharedData();
      // Get.find<CartController>().clearCartList();
      // Get.find<WishListController>().removeWishes();
      // Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));

    } else {
      Get.back();
      ApiChecker.checkApi(response);
    }
  } // end of remove user

  String getUserID() {
    return Get.find<AuthController>().getDecodedUserId();
  }

  Future<ResponseModel> changePassword(
      {phoneNumber, oldPassword, newPassword}) async {
    Dialogs.showLoading();
    Response response = await userRepo.changePassword(
        phone: phoneNumber, oldPassword: oldPassword, newPassword: newPassword);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'successful');
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["Message"]);
    }
    Dialogs.dismiss();
    return responseModel;
  } // end of change password

  Future<ResponseModel> updateUserAvatar({required avatarPath}) async {
    Dialogs.showLoading();
    ResponseModel _responseModel = ResponseModel(false, "Failed To Update");

    Map<String, dynamic> avatarData = {
      "avatarPath": avatarPath,
      "index": _selectedAvatarIndex
    };

    bool isUpdated = await userRepo.updateUserAvatar(avatarData);
    _avatarPath = avatarPath;
    update();

    if (isUpdated) {
      _responseModel = ResponseModel(true, "Updated Successfully");
    }
    Dialogs.dismiss();
    return _responseModel;
  }

  void getAvatarAndIniIndex() async {
    var data = await userRepo.getUserAvatar();
    Map<String, dynamic> avatarData = json.decode(data);
    _selectedAvatarIndex = avatarData["index"] ?? 0;
    _avatarPath = avatarData["avatarPath"] ?? Images.MAIN_AVATAR;
  }

  void changeSelectedAvatarIndex(int index) {
    _selectedAvatarIndex = index;
    update();
  }
}
