class NewInMenuModel {
  String? id;
  String? itemName;
  double? itemPrice;

  NewInMenuModel({this.id, this.itemName, this.itemPrice});

  NewInMenuModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    itemName = json['ItemName'];
    itemPrice = json['ItemPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ItemName'] = this.itemName;
    data['ItemPrice'] = this.itemPrice;
    return data;
  }
}
