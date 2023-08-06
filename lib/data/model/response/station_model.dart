import 'dart:convert';

import 'package:the_drive/data/model/body/station_name.dart';

class StationModel {
  String? stationId;
  StationName? stationName;

  StationModel({this.stationId, this.stationName});

  StationModel.fromJson(Map<String, dynamic> data) {
    stationId = data['Id'];
    stationName = data['StationName'] != null
        ? StationName.fromJson(json.decode(data['StationName']))
        : null;
  }
}
