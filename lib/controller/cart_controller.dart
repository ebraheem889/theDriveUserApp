import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/data/model/body/cart_item.dart';
import 'package:the_drive/data/model/response/cart_model.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/data/model/response/product_model.dart';
import 'package:the_drive/data/repository/cart_repo.dart';
import 'package:the_drive/helper/date_converter.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';

class CartController extends GetxController implements GetxService {
  late CartRepo _cartRepo;
  CartController({required CartRepo cartRepo}) {
    _cartRepo = cartRepo;
  }

  Map<String, ItemModel> Items = {};

  List<ItemModel> _cartList = [];

  List<ItemModel> get CartList => _cartList;

  List<ItemModel> getAllCartItems() {
    List<ItemModel> allInCart = Items.entries.map((e) {
      return e.value;
    }).toList();
    _cartList = allInCart;

    return allInCart;
  }

  void addItemToCart(ItemModel item, int quantity,
      {double addsOnTotalPrice = 0, bool isCustom = false}) async {
    if (isCustom) {
      _addCustomizedItemToCart(item, quantity, addsOnTotalPrice);
    } else {
      _addDefaultItemToCart(item, quantity, addsOnTotalPrice);
    }

    await _cartRepo.addItemToLocaleStorage(getAllCartItems());
    update();
  }

  void _addDefaultItemToCart(
      ItemModel item, int quantity, double addsOnTotalPrice) {
    var totalquantity = 0;
    if (Items.containsKey(item.menuId)) {
      Items.update(item.menuId.toString(), (value) {
        totalquantity = value.quantity + quantity;
        return ItemModel(
          stationId: item.stationId,
          menuId: item.menuId,
          itemName: item.itemName,
          itemPrice: item.itemPrice! + addsOnTotalPrice,
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
      removeIf(item, totalquantity);
    } else {
      //if the scenario got here that means the product is not in the Items(the map we declare up there ) so we will add it but first
      //1- check if the quantity of the item that we are going to add greater than zero or ont,
      //2- if it's then we weill add it if not we will send a message to the user let him know that it's not allowed
      if (quantity > 0) {
        Items.putIfAbsent(item.menuId.toString(), () {
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
        showCustomSnackBar(
          "You Can't Add Less Than One Item !",
        );
      }
    }
  }

  void _addCustomizedItemToCart(
      ItemModel item, int quantity, double addsOnTotalPrice) {
    var totalquantity = 0;
    if (Items.containsKey(item.menuId) &&
        (getItemPrice(item) <
            double.parse((item.itemPrice! + addsOnTotalPrice).toString()))) {
      Items.update(item.menuId.toString(), (value) {
        totalquantity = value.quantity + quantity;
        return ItemModel(
          stationId: item.stationId,
          menuId: item.menuId,
          itemName: item.itemName,
          itemPrice: item.itemPrice! + addsOnTotalPrice,
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
      removeIf(item, totalquantity);
    }
    if (quantity > 0) {
      Items.putIfAbsent(item.menuId.toString(), () {
        return ItemModel(
          stationId: item.stationId,
          menuId: item.menuId,
          itemName: item.itemName,
          itemPrice: item.itemPrice! + addsOnTotalPrice,
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
    }
  }

  bool isExistInCart(ItemModel item) {
    if (Items.containsKey(item.menuId)) {
      return true;
    }
    return false;
  }

  int getTotalQuantity() {
    var totalquantity = 0;
    Items.forEach((key, value) {
      totalquantity += value.quantity;
    });
    return totalquantity;
  } // end of total qty

  double getTotalFees() {
    double totalFees = 0;
    Items.forEach((key, value) {
      totalFees = totalFees + (value.itemPrice! * value.quantity);
    });
    return totalFees;
  } //end of total fees

  void removeIf(ItemModel item, int totalquantity) {
    if (totalquantity <= 0) {
      if (totalquantity <= 0) {
        Items.remove(item.menuId);
      }
    }
  }

  void removeIfDissmissable(ItemModel item) async {
    Items.remove(item.menuId);
    await _cartRepo.addItemToLocaleStorage(getAllCartItems());
    update();
  }

  // 2-
  Future<List<ItemModel>> getCartList() async {
    var StorageCartList = await _cartRepo.getCartItemsList();
    return StorageCartList;
  }

  // 1-
  Future<void> setCarListFromLocalStorage() async {
    var StorageCartList = await getCartList();

    for (int i = 0; i < StorageCartList.length; i++) {
      Items.putIfAbsent(
          StorageCartList[i].menuId.toString(), () => StorageCartList[i]);
    }

    update();
  }

  int getQuentity(ItemModel item) {
    var quantity = 0;
    if (Items.containsKey(item.menuId)) {
      Items.forEach((key, value) {
        if (item.menuId == key) {
          quantity = value.quantity;
        }
      });
    }

    return quantity;
  }

  double getItemPrice(ItemModel item) {
    double itemPrice = 0;
    if (Items.containsKey(item.menuId)) {
      Items.forEach((key, value) {
        if (item.menuId == key) {
          itemPrice = value.itemPrice ?? 0;
        }
      });
    }

    log("current item Price================>" + itemPrice.toString());
    return itemPrice;
  }
}
