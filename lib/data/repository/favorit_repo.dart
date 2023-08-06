import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/model/body/cart_item.dart';
import 'package:the_drive/data/model/response/cart_model.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/util/app_constants.dart';

class FavoritRepo {
  final SharedPreferences sharedPreferences;
  FavoritRepo({required this.sharedPreferences});

  List<String> Item = [];

  Future<void> addItemToLocaleStorage(List<ItemModel> FavoritList) async {
    Item = [];
    FavoritList.forEach((element) {
      return Item.add(jsonEncode(element));
    });

    await sharedPreferences.setStringList(AppConstants.FAVORIT_LIST, Item);
  }

  Future<List<ItemModel>> getFavoritsList() async {
    List<ItemModel> FavoritItems = [];
    if (sharedPreferences.containsKey(AppConstants.FAVORIT_LIST)) {
      var Items =
          await sharedPreferences.getStringList(AppConstants.FAVORIT_LIST);
      Items!.map((element) {
        return FavoritItems.add(ItemModel.fromJson(jsonDecode(element)));
      }).toList();
    }

    return FavoritItems;
  }
}
