import 'package:the_drive/data/model/body/station_name.dart';
import 'dart:convert';

class BannerModel {
  String? id;
  String? stationId;
  StationName? stationName;
  String? name;
  String? imgPath;
  bool? isActive;

  BannerModel(
      {this.id,
      this.stationId,
      this.stationName,
      this.name,
      this.imgPath,
      this.isActive});

  BannerModel.fromJson(Map<String, dynamic> data) {
    id = data['Id'];
    stationId = data['StationId'];
    stationName = StationName.fromJson(json.decode(data['StationName']));
    name = data['Name'];
    imgPath = data['ImgPath'];
    isActive = data['IsActive'];
  }
}
