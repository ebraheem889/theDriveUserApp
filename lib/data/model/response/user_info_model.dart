class UserInfoData {
  String? id;
  String? firstname;
  String? lastname;
  String? status;
  String? email;
  dynamic role;
  String? cellphonenum;
  String? DateOfBirth;
  String? Gender;

  UserInfoData(
      {this.id,
      this.firstname,
      this.lastname,
      this.status,
      this.email,
      this.role,
      this.cellphonenum,
      this.DateOfBirth,
      this.Gender});

  UserInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    status = json['status'];
    email = json['email'];
    role = json['role'];
    cellphonenum = json['cellphonenum'];
    DateOfBirth = json['DateOfBirth'];
    Gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['status'] = this.status;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
