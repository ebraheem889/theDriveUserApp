import 'dart:convert';

class AddOnCategory {
  String? categoryAddonId;
  String? categoryCode;
  String? category;
  String? addonsTypeCode;
  String? addonsType;
  AddOnItemName? addonItemName;
  double? addonPrice;
  bool isSelected = false;

  AddOnCategory(
      {this.categoryAddonId,
      this.categoryCode,
      this.category,
      this.addonsTypeCode,
      this.addonsType,
      this.addonItemName,
      this.addonPrice,
      this.isSelected = false});

  AddOnCategory.fromJson(Map<String, dynamic> data) {
    categoryAddonId = data['CategoryAddonId'];
    categoryCode = data['CategoryCode'];
    category = data['Category'];
    addonsTypeCode = data['AddonsTypeCode'];
    addonsType = data['AddonsType'];
    isSelected = false;
    addonItemName = data['AddonItemName'] != null
        ? AddOnItemName.fromJson(json.decode(data['AddonItemName']))
        : null;
    addonPrice = data['AddonPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryAddonId'] = this.categoryAddonId;
    data['CategoryCode'] = this.categoryCode;
    data['Category'] = this.category;
    data['AddonsTypeCode'] = this.addonsTypeCode;
    data['AddonsType'] = this.addonsType;
    data['AddonItemName'] = this.addonItemName;
    data['AddonPrice'] = this.addonPrice;
    return data;
  }
}

class AddOnItemName {
  String? en;
  String? ar;

  AddOnItemName({this.en, this.ar});

  AddOnItemName.fromJson(Map<String, dynamic> data) {
    en = data['En'];
    ar = data['Ar'];
  }
}
