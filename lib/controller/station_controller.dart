import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:the_drive/data/api/api_checker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:the_drive/data/model/response/category_model.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/data/model/response/pick_up_type.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/model/response/station_model.dart';
import 'package:the_drive/data/repository/splah_repo.dart';
import 'package:the_drive/data/repository/station_repo.dart';

class StationController extends GetxController implements GetxService {
  final StationRepo stationRepo;
  StationController({required this.stationRepo});

  List<StationModel> _stationList = [];
  List<PickUpType> _pickUpList = [];
  List<ItemModel> _menusList = [];
  List<ItemModel> _menusListByID = [];
  List<ItemModel> _filterdMenus = [];

  static const int stationListToPreview = 8;

  List<Category> _categoriesBased = [];

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  int _pickUpselectedIndex = -1;
  int _categorySelectedIndex = 0;

  bool _isLoading = false;
  bool _isMenuLoading = false;

  bool get isLoading => _isLoading;
  bool get isMenuLoading => _isMenuLoading;
  List<StationModel> get stationList => _stationList;
  List<PickUpType> get pickUpList => _pickUpList;
  List<ItemModel> get menuList => _menusList;
  List<ItemModel> get menusListById => _menusListByID;
  List<ItemModel> get filterdMenus => _filterdMenus;

  int get pickUpselectedIndex => _pickUpselectedIndex;
  set pickUpselectedIndex(int val) => _pickUpselectedIndex = val;
  int get categorySelectedIndex => _categorySelectedIndex;
  set categorySelectedIndex(int val) => _categorySelectedIndex = val;

  List<Category> get categoriesBased => _categoriesBased;

  Future<ResponseModel> getAllStations() async {
    _isLoading = true;
    update();
    _stationList.clear();
    Response response = await stationRepo.getAllStations();

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      response.body["items"]
          .forEach((item) => _stationList.add(StationModel.fromJson(item)));
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["message"].toString());
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  // start refactoring

  Future<void> getStations(bool reload) async {
    _isLoading = true;
    update();
    if (_stationList.isEmpty || reload) {
      Response response = await stationRepo.getAllStations();
      log("make station request==================>" + response.body.toString());
      if (response.statusCode == 200) {
        _stationList.clear();
        response.body["items"]
            .forEach((item) => _stationList.add(StationModel.fromJson(item)));
        _isLoading = false;
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    }
  }

  Future<void> getStationCategories({stationId}) async {
    Response response =
        await stationRepo.getStationCategories(stationId: stationId);

    if (response.statusCode == 200) {
      response.body["items"].forEach((item) => Categories.cats.putIfAbsent(
          item['Category'], () => Category.fromJson(item['displayvalue'])));
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // end refactoring
  Future<ResponseModel> getPickTypes() async {
    _isLoading = true;
    _pickUpList.clear();
    Response response = await stationRepo.getPickUpTypes();

    log("pick up list =================>" + response.body.toString());
    _isLoading = false;
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      response.body["items"][0]["items"]
          .forEach((item) => _pickUpList.add(PickUpType.fromJson(item)));
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getAllMenus() async {
    _isLoading = true;

    Response response = await stationRepo.getAllmenus();

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      response.body["items"]
          .forEach((item) => _menusList.add(ItemModel.fromJson(item)));
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getAllCategoriesForOffers() async {
    _isLoading = true;

    Response response = await stationRepo.getAllmenus();

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      Categories.cats.removeWhere((key, value) => key.toLowerCase() != "all");

      response.body["items"].forEach((item) => Categories.cats.putIfAbsent(
          item['Category'], () => Category.fromJson(item['Category'])));

      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getMenuByIdAndPickUp({stationId, pickUp, index}) async {
    _isMenuLoading = true;

    clearCategories();
    initPickUpIndex(index);
    initIndexAndFilter(_categorySelectedIndex, "all");
    Response response = await stationRepo.getMenuByIdAndPickUp(
        stationId: stationId, pickUp: pickUp);
    log("getMenuByIdAndPickUp call================> ${response.body}");

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      response.body["items"]
          .forEach((item) => _menusListByID.add(ItemModel.fromJson(item)));

      setCategories();
      _filterdMenus.addAll(_menusListByID);
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["message"]);
    }

    _isMenuLoading = false;
    update();
    return responseModel;
  }

  void initPickUpIndex(int index) {
    _pickUpselectedIndex = index;
    _categorySelectedIndex = 0;
    update();
  }

  void initIndexAndFilter(int index, String category) {
    _categorySelectedIndex = index;
    categoryBasedFilter(category, index);
    update();
  }

  void categoryBasedFilter(String category, int index) {
    _filterdMenus.clear();
    if (index == 0) {
      _filterdMenus.addAll(_menusListByID);
    } else {
      _filterdMenus = _menusListByID
          .where((element) =>
              element.category!.toLowerCase() == category.toLowerCase())
          .toList();
    }
  }

  void setCategories() {
    _categories.clear();
    Categories.cats.forEach((key, value) {
      _categories.add(value);
    });
  }

  void clearCategories() {
    _menusListByID.clear();
    _filterdMenus.clear();
    Categories.cats.removeWhere((key, value) => key.toLowerCase() != "all");
  }

  int getstationCounterToView() {
    if (_stationList.length > stationListToPreview) {
      return stationListToPreview;
    }

    return _stationList.length;
  }

  void stationBasedFilter() {}
}
