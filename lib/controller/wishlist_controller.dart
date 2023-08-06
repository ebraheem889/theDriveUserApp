import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/model/response/product_model.dart';
import 'package:the_drive/data/repository/productRepo.dart';
import 'package:the_drive/data/repository/wishlistRepo.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';

class WishListController extends GetxController implements GetxService {
  final WishListRepo wishListRepo;
  final ProductRepo productRepo;
  WishListController({required this.wishListRepo, required this.productRepo});

  late List<Product> _wishProductList;
  late List<dynamic> _wishRestList;
  List<int> _wishProductIdList = [];
  List<int> _wishRestIdList = [];

  List<Product> get wishProductList => _wishProductList;
  List<dynamic> get wishRestList => _wishRestList;
  List<int> get wishProductIdList => _wishProductIdList;
  List<int> get wishRestIdList => _wishRestIdList;

  void addToWishList(
      Product product, dynamic restaurant, bool isRestaurant) async {
    Response response = await wishListRepo.addWishList(
        isRestaurant ? restaurant.id : product.id, isRestaurant);
    if (response.statusCode == 200) {
      if (isRestaurant) {
        _wishRestIdList.add(restaurant.id);
        _wishRestList.add(restaurant);
      } else {
        _wishProductList.add(product);
        _wishProductIdList.add(product.id!);
      }
      showCustomSnackBar(response.body['message'], isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void removeFromWishList(int id, bool isRestaurant) async {
    Response response = await wishListRepo.removeWishList(id, isRestaurant);
    if (response.statusCode == 200) {
      int _idIndex = -1;
      if (isRestaurant) {
        _idIndex = _wishRestIdList.indexOf(id);
        _wishRestIdList.removeAt(_idIndex);
        _wishRestList.removeAt(_idIndex);
      } else {
        _idIndex = _wishProductIdList.indexOf(id);
        _wishProductIdList.removeAt(_idIndex);
        _wishProductList.removeAt(_idIndex);
      }
      showCustomSnackBar(response.body['message'], isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getWishList() async {
    _wishProductList = [];
    _wishRestList = [];
    _wishRestIdList = [];
    Response response = await wishListRepo.getWishList();
    if (response.statusCode == 200) {
      update();
      response.body['food'].forEach((food) async {
        Product _product = Product.fromJson(food);
        _wishProductList.add(_product);
        _wishProductIdList.add(_product.id!);
      });
      response.body['restaurant'].forEach((restaurant) async {
        dynamic _restaurant;
        try {
          _restaurant = null;
        } catch (e) {}
        _wishRestList.add(_restaurant);
        _wishRestIdList.add(_restaurant.id);
      });
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void removeWishes() {
    _wishProductIdList = [];
    _wishRestIdList = [];
  }
}
