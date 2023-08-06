import 'package:the_drive/data/model/response/product_model.dart';

class CartModel {
  String? stationNameAr;
  String? stationNameEn;
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
  int? quantity;

  CartModel(
      {this.stationNameAr,
      this.stationNameEn,
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
      this.activeflag,
      this.quantity}) {}

  CartModel.fromJson(Map<String, dynamic> data) {
    stationNameAr = data['StationName'];
    stationNameEn = data['StationName'];
    stationId = data['StationId'];
    menuId = data['MenuId'];
    itemName = data['ItemName'];
    itemPrice = data['ItemPrice'];
    category = data['Category'];
    CategoryCode = data['CategoryCode'];
    pickup = data['Pickup'];
    size = data['Size'];
    duration = data['Duration'];
    defaultAddsOn = data['DefaultAddsOn'];
    addsOn = data['AddsOn'];
    productDescription = data['ProductDescription'];
    path = data['Path'];
    activeflag = data['activeflag'];
    quantity = data['quantity'];
  }
}
