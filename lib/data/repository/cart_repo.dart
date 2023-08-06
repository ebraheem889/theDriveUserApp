import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/model/body/cart_item.dart';
import 'package:the_drive/data/model/response/cart_model.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/util/app_constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> Cart = [];

  Future<void> addItemToLocaleStorage(List<ItemModel> CartList) async {
    log("addItemToLocaleStorage invoked===================================>");
    Cart = [];
    CartList.forEach((element) {
      return Cart.add(jsonEncode(element));
    });

    await sharedPreferences.setStringList(AppConstants.CART_LIST, Cart);
  }

  Future<List<ItemModel>> getCartItemsList() async {
    List<ItemModel> CartItems = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      var Items = await sharedPreferences.getStringList(AppConstants.CART_LIST);
      Items!.map((element) {
        return CartItems.add(ItemModel.fromJson(jsonDecode(element)));
      }).toList();
    }

    return CartItems;
  }
}
