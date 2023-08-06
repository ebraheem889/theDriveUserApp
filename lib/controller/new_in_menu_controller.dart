import 'dart:developer';

import 'package:get/get.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/new_in_menu_model.dart';
import 'package:the_drive/data/model/response/offer_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/new_in_menu_repo.dart';
import 'package:the_drive/data/repository/offer_repo.dart';

class NewInMenuController extends GetxController implements GetxService {
  final NewInMenueRepo newinMenuRepo;

  NewInMenuController({required this.newinMenuRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<NewInMenuModel> _newInList = [];
  List<NewInMenuModel> get newInMenuList => _newInList;

  Future<void> getNewInMenu(bool reload) async {
    _isLoading = true;
    update();
    if (_newInList.isEmpty || reload) {
      Response response = await newinMenuRepo.getNewInMenu();

      if (response.statusCode == 200) {
        _newInList.clear();
        response.body["items"]
            .forEach((item) => _newInList.add(NewInMenuModel.fromJson(item)));
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }

  Future<void> getNewInMenuByID(Id) async {
    _isLoading = true;
    update();
    if (_newInList.isEmpty) {
      Response response = await newinMenuRepo.getNewInMenuById(ID: Id);

      if (response.statusCode == 200) {
        _newInList.clear();
        response.body["items"]
            .forEach((item) => _newInList.add(NewInMenuModel.fromJson(item)));
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }
}
