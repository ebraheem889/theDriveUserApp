import 'dart:convert';

import 'package:the_drive/data/model/response/category_model.dart';

class ItemModel {
  StationName? stationName;
  String? stationId;
  String? menuId;
  String? itemName;
  double? itemPrice;
  String? category;
  String? CategoryCode;
  String? pickup;
  String? size;
  String? duration;
  String? defaultAddsOn;
  String? addsOn;
  String? productDescription;
  dynamic path;
  bool? activeflag;
  int quantity = 1;

  ItemModel(
      {this.stationName,
      this.stationId,
      this.menuId,
      this.itemName,
      this.itemPrice,
      this.category,
      this.CategoryCode,
      this.pickup,
      this.size,
      this.duration,
      this.defaultAddsOn,
      this.addsOn,
      this.productDescription,
      this.path,
      this.quantity = 1,
      this.activeflag});

  ItemModel.fromJson(Map<String, dynamic> data) {
    stationName = data['StationName'] != null
        ? StationName.fromJson(json.decode(data['StationName']))
        : null;
    stationId = data['StationId'];
    menuId = data['MenuId'];
    itemName = data['ItemName'];
    itemPrice = data['ItemPrice'];
    category = data['Category'];
    CategoryCode = data['CategoryCode'];

    Categories.cats.putIfAbsent(
        data['Category'], () => Category.fromJson(data['Category']));

    pickup = data['Pickup'];
    size = data['Size'];
    duration = data['Duration'];
    defaultAddsOn = data['DefaultAddsOn'];
    addsOn = data['AddsOn'];
    productDescription = data['ProductDescription'];
    path = data['Path'];
    activeflag = data['activeflag'];
  }

  ItemModel.fromJsonTocart(Map<String, dynamic> json) {
    stationName = json['StationName'];
    stationId = json['StationId'];
    menuId = json['MenuId'];
    itemName = json['ItemName'];
    itemPrice = json['ItemPrice'];
    quantity = json['quantity'];
    category = json['Category'];
    CategoryCode = json['CategoryCode'];
    pickup = json['Pickup'];
    size = json['Size'];
    duration = json['Duration'];
    defaultAddsOn = json['DefaultAddsOn'];
    addsOn = json['AddsOn'];
    productDescription = json['ProductDescription'];
    path = json['Path'];
    activeflag = json['activeflag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StationName'] = this.stationName;
    data['StationId'] = this.stationId;
    data['MenuId'] = this.menuId;
    data['ItemName'] = this.itemName;
    data['ItemPrice'] = this.itemPrice;
    data['Category'] = this.category;
    data['Pickup'] = this.pickup;
    data['Size'] = this.size;
    data['Duration'] = this.duration;
    data['DefaultAddsOn'] = this.defaultAddsOn;
    data['AddsOn'] = this.addsOn;
    data['ProductDescription'] = this.productDescription;
    data['Path'] = this.path;
    data['activeflag'] = this.activeflag;
    return data;
  }
}

class StationName {
  String? en;
  String? ar;

  StationName({this.en, this.ar});

  StationName.fromJson(Map<String, dynamic> data) {
    en = data['En'];
    ar = data['Ar'];
  }
}
