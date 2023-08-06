import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/data/api/api_checker.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/model/response/add_on_category.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/data/repository/category_add_on_repo.dart';
import 'package:the_drive/data/repository/favorit_repo.dart';

class FavoritController extends GetxController implements GetxService {
  final FavoritRepo favoritRepo;

  FavoritController({required this.favoritRepo}) {}

  Map<String, ItemModel> _favoriList = {};

  CartController _cartController = Get.find<CartController>();

  Map<String, ItemModel> get favoritList => _favoriList;

  List<ItemModel> getFavoritList() {
    List<ItemModel> favoritList = _favoriList.entries.map((e) {
      return e.value;
    }).toList();

    return favoritList;
  }

  void addToFavorit(ItemModel item, int quantity) async {
    var totalquantity = 0;
    if (_favoriList.containsKey(item.menuId)) {
      _favoriList.update(item.menuId.toString(), (value) {
        totalquantity = value.quantity + quantity;
        return ItemModel(
          stationId: item.stationId,
          menuId: item.menuId,
          itemName: item.itemName,
          itemPrice: item.itemPrice,
          category: item.category,
          pickup: item.pickup,
          size: item.size,
          duration: item.duration,
          defaultAddsOn: item.defaultAddsOn,
          addsOn: item.addsOn,
          productDescription: item.productDescription,
          quantity: value.quantity + quantity,
        );
      });
      // to remove the product if it's quantity equal zero
      removeIf(item, totalquantity);
    } else {
      if (quantity > 0) {
        _favoriList.putIfAbsent(item.menuId.toString(), () {
          return ItemModel(
            stationId: item.stationId,
            menuId: item.menuId,
            itemName: item.itemName,
            itemPrice: item.itemPrice,
            category: item.category,
            pickup: item.pickup,
            size: item.size,
            duration: item.duration,
            defaultAddsOn: item.defaultAddsOn,
            addsOn: item.addsOn,
            productDescription: item.productDescription,
            quantity: item.quantity,
          );
        });
      } else {
        Get.snackbar("Item Count", "You Can't Add Less Than One Item ",
            backgroundColor: Colors.red);
      }
    }

    await favoritRepo.addItemToLocaleStorage(getFavoritList());
    update();
  } // end of add to favorit

  bool isExistInFavorit(ItemModel item) {
    if (_favoriList.containsKey(item.menuId)) {
      return true;
    }
    return false;
  }

  void removeIf(ItemModel item, int totalquantity) {
    if (totalquantity <= 0) {
      if (totalquantity <= 0) {
        _favoriList.remove(item.menuId);
      }
    }
  } // end of remove if

  void removeFromFavorit(ItemModel item) async {
    _favoriList.remove(item.menuId);
    await favoritRepo.addItemToLocaleStorage(getFavoritList());
    update();
  } // end of remove if

  void removeIfDissmissable(ItemModel item) async {
    _favoriList.remove(item.menuId);
    await favoritRepo.addItemToLocaleStorage(getFavoritList());
    update();
  }

  // 2-
  Future<List<ItemModel>> _getStorageFavoritList() async {
    var StorageFavoritList = await favoritRepo.getFavoritsList();
    return StorageFavoritList;
  }

  // 1-
  Future<void> setFavoritList() async {
    var StorageCartList = await _getStorageFavoritList();

    for (int i = 0; i < StorageCartList.length; i++) {
      _favoriList.putIfAbsent(
          StorageCartList[i].menuId.toString(), () => StorageCartList[i]);
    }

    update();
  }

  int getQuentity(ItemModel item) {
    var quantity = 0;
    if (_favoriList.containsKey(item.menuId)) {
      _favoriList.forEach((key, value) {
        if (item.menuId == key) {
          quantity = value.quantity;
        }
      });
    }

    return quantity;
  }

  void addToCart(ItemModel item) {
    _cartController.addItemToCart(item, item.quantity);
    update();
  }
}
