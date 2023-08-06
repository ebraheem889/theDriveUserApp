import 'dart:developer';

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/banner_mode.dart';
import 'package:the_drive/data/model/response/offer_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/banner_repo.dart';
import 'package:the_drive/data/repository/new_in_menu_repo.dart';
import 'package:the_drive/data/repository/offer_repo.dart';

class BannerController extends GetxController implements GetxService {
  final BannerRepo bannerRepo;

  BannerController({required this.bannerRepo});

  bool _isLoading = false;
  bool get isloading => _isLoading;
  List<BannerModel> _bannersLis = [];
  List<BannerModel> get bannersList => _bannersLis;

  Future<void> getBanners(bool reload) async {
    _isLoading = true;
    update();
    if (_bannersLis.isEmpty || reload) {
      Response response = await bannerRepo.getBanners();

      if (response.statusCode == 200) {
        log("Banner Call =============================> ");
        _bannersLis.clear();
        response.body["items"]
            .forEach((item) => _bannersLis.add(BannerModel.fromJson(item)));
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }

  Future<void> getBannerById(Id) async {
    _isLoading = true;
    update();
    if (_bannersLis.isEmpty) {
      Response response = await bannerRepo.getBannerById(ID: Id);

      if (response.statusCode == 200) {
        _bannersLis.clear();
        response.body["items"]
            .forEach((item) => _bannersLis.add(BannerModel.fromJson(item)));
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }
}
