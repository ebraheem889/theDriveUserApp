import 'dart:convert';

import 'package:the_drive/data/model/body/station_name.dart';

class offerModel {
  String? id;
  String? offerName;
  double? price;
  String? discount;
  String? validFrom;
  String? validTo;
  String? imgPath;
  String? stationId;
  StationName? stationName;
  String? itemName;
  String? category;

  offerModel(
      {this.id,
      this.offerName,
      this.price,
      this.discount,
      this.validFrom,
      this.validTo,
      this.imgPath,
      this.stationId,
      this.stationName,
      this.itemName,
      this.category});

  offerModel.fromJson(Map<String, dynamic> data) {
    id = data['Id'];
    offerName = data['OfferName'];
    price = data['Price'];
    discount = data['Discount'];
    validFrom = data['ValidFrom'];
    validTo = data['ValidTo'];
    imgPath = data['ImgPath'];
    stationId = data['StationId'];
    stationName = StationName.fromJson(json.decode(data['StationName']));
    itemName = data['ItemName'];
    category = data['Category'];
  }
}
