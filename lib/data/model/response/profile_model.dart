class ProfileModel {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? image;

  ProfileModel({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;

    return data;
  }
}
