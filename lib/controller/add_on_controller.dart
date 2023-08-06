import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/add_on_category.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/add_on_repo.dart';

class AddOnController extends GetxController implements GetxService {
  final AddOnRepo addOnRepo;

  AddOnController({required this.addOnRepo});

  bool _isloading = false;

  bool get isLoading => _isloading;
  List<AddOnCategory> _addonsCategoriesList = [];

  List<AddOnCategory> get addonsCategoriesList => _addonsCategoriesList;

  Future<void> getProductAddOns(String category) async {
    _isloading = true;
    update();
    _addonsCategoriesList.clear();
    Response response = await addOnRepo.productAddOns(category: category);

    if (response.statusCode == 200) {
      response.body["items"].forEach(
          (item) => _addonsCategoriesList.add(AddOnCategory.fromJson(item)));
    } else {
      ApiChecker.checkApi(response);
    }

    _isloading = false;
    update();
  }
}
