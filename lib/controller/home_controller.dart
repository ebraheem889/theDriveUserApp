import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/data/model/response/station_model.dart';
import 'package:the_drive/data/repository/home_repo.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepo homeRepo;
  final SharedPreferences sharedPreferences;
  HomeController({required this.homeRepo, required this.sharedPreferences}) {}

  bool _isCartOpend = false;
  bool _isLoading = false;

  bool get isCartOpend => _isCartOpend;
  bool get isLoading => _isLoading;
  List<StationModel> _stationList = [];

  List<StationModel> get stationList => _stationList;

  void toggleCart() {
    _isCartOpend = !_isCartOpend;
    update();
  }

  Future<void> getHomeData() async {
    await getAllStations();
  } // end of get home data

  Future<void> getAllStations() async {
    _stationList.clear();
    _isLoading = true;
    update();
    Get.find<StationController>().getAllStations().then((status) {
      if (status.isSuccess) {
        _isLoading = false;
        update();
        _stationList.addAll(Get.find<StationController>().stationList);
      } else {
        _stationList = [];
      }
    });
  } // end of get all stations
}
