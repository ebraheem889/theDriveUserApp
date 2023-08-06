import 'dart:developer';

import 'package:get/get.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/category_model.dart';
import 'package:the_drive/data/model/response/offer_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/offer_repo.dart';
import 'package:the_drive/data/repository/station_repo.dart';

class OfferController extends GetxController implements GetxService {
  final OfferRepo offerRepo;

  OfferController({required this.offerRepo});

  bool _isLoading = false;
  List<offerModel> _offersList = [];
  List<offerModel> _filterdOffersList = [];
  List<String> _categories = [];

  List<String> get categories => _categories;

  List<offerModel> get offersList => _offersList;
  bool get isLoading => _isLoading;
  List<offerModel> get filterdMenus => _filterdOffersList;

  Future<void> getOffers(bool reload) async {
    _isLoading = true;
    update();
    if (_offersList.isEmpty || reload) {
      Response response = await offerRepo.getAllOffers();

      if (response.statusCode == 200) {
        _offersList.clear();
        response.body["items"]
            .forEach((item) => _offersList.add(offerModel.fromJson(item)));
        _filterdOffersList = _offersList;
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }

  Future<void> getCategories({stationId}) async {
    Categories.cats.removeWhere((key, value) => key.toLowerCase() != "all");
    _isLoading = true;
    update();
    await Get.find<StationController>()
        .getStationCategories(stationId: stationId);
    initCategories();
    _isLoading = false;
    update();
  }

  void stationFilter({stationName}) {
    _filterdOffersList = _offersList
        .where((element) => element.stationName!.en == stationName)
        .toList();
    update();
  }

  void categoryFilter(
      {required String categoryName, required String StationId}) {
    if (categoryName.toLowerCase() == "all") {
      _filterdOffersList = _offersList
          .where((element) => element.stationId == StationId)
          .toList();
    } else {
      _filterdOffersList = _offersList
          .where((element) =>
              element.category == categoryName &&
              element.stationId == StationId)
          .toList();
    }

    update();
  }

  void offerCategoryFiltration({required String categoryName}) {
    _filterdOffersList = _offersList
        .where((element) =>
            element.stationName!.en!.toLowerCase() ==
            categoryName.toLowerCase())
        .toList();
    update();
  }

  Future<void> initCategories() async {
    _categories = Categories.cats.entries.map((e) {
      return e.value.categoryName.toString();
    }).toList();
  }

  void initFilterdOffersList() {
    _filterdOffersList = _offersList
        .where((element) => element.stationId == _offersList.first.stationId)
        .toList();
  }
}
