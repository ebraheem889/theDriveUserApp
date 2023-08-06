class PickUpType {
  String? id;
  String? lovTypeId;
  String? code;
  String? displayValue;
  int? displayOrder;
  bool? active;
  dynamic lang;
  dynamic parentCode;
  String? createdOn;
  String? createdBy;
  String? modifiedOn;
  String? modifiedBy;

  PickUpType(
      {this.id,
      this.lovTypeId,
      this.code,
      this.displayValue,
      this.displayOrder,
      this.active,
      this.lang,
      this.parentCode,
      this.createdOn,
      this.createdBy,
      this.modifiedOn,
      this.modifiedBy});

  PickUpType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lovTypeId = json['lovTypeId'];
    code = json['code'];
    displayValue = json['displayValue'];
    displayOrder = json['displayOrder'];
    active = json['active'];
    lang = json['lang'];
    parentCode = json['parentCode'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    modifiedOn = json['modifiedOn'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lovTypeId'] = this.lovTypeId;
    data['code'] = this.code;
    data['displayValue'] = this.displayValue;
    data['displayOrder'] = this.displayOrder;
    data['active'] = this.active;
    data['lang'] = this.lang;
    data['parentCode'] = this.parentCode;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['modifiedOn'] = this.modifiedOn;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
