import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/response/add_on_category.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/category_add_on_repo.dart';

class CategoryAddOnController extends GetxController implements GetxService {
  final CategoryAddOnRepo categoryAddOnRepo;

  CategoryAddOnController({required this.categoryAddOnRepo}) {}

  bool _isLoading = true;

  late List<AddOnCategory> _addOnCategories;
  List<AddOnCategory> get addOnCategoriesList => _addOnCategories;

  bool get isLoading => _isLoading;

  Future<ResponseModel> getAllCategories() async {
    Response response = await categoryAddOnRepo.getAllCategories();
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
      response.body["items"].forEach(
          (item) => _addOnCategories.add(AddOnCategory.fromJson(item)));
    } else {
      ApiChecker.checkApi(response);
      _addOnCategories = [];
      responseModel = ResponseModel(false, response.body["message"]);
    }

    _isLoading = false;
    update();
    return responseModel;
  } // end of get all categories

  Future<ResponseModel> getCategoryByCode({categoryCode}) async {
    Response response =
        await categoryAddOnRepo.getCategoryById(categoryCode: categoryCode);

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  } // end of get category by code
}
