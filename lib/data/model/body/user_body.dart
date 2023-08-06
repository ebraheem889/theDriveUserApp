class UserBody {
  String? id;
  String? firstName;
  dynamic middleName;
  String? lastName;
  dynamic userType;
  String? email;
  String? password;
  dynamic managerId;
  String? status;
  dynamic workPhoneNum;
  dynamic homePhoneNum;
  dynamic cellPhoneNum;
  dynamic primaryRoleId;
  String? userId;
  String? userAttribute;
  String? dateOfBirth;
  String? gender;
  bool? termsConditionsAcceptance;

  UserBody(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.userType,
      this.email,
      this.password,
      this.managerId,
      this.status,
      this.workPhoneNum,
      this.homePhoneNum,
      this.cellPhoneNum,
      this.primaryRoleId,
      this.userId,
      this.userAttribute,
      this.dateOfBirth,
      this.gender,
      this.termsConditionsAcceptance});

  UserBody.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    userType = json['userType'];
    email = json['email'];
    password = json['password'];
    managerId = json['managerId'];
    status = json['status'];
    workPhoneNum = json['workPhoneNum'];
    homePhoneNum = json['homePhoneNum'];
    cellPhoneNum = json['cellPhoneNum'];
    primaryRoleId = json['primaryRoleId'];
    userId = json['userId'];
    userAttribute = json['userAttribute'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    termsConditionsAcceptance = json['termsConditionsAcceptance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['userType'] = this.userType;
    data['email'] = this.email;
    data['password'] = this.password;
    data['managerId'] = this.managerId;
    data['status'] = this.status;
    data['workPhoneNum'] = this.workPhoneNum;
    data['homePhoneNum'] = this.homePhoneNum;
    data['cellPhoneNum'] = this.cellPhoneNum;
    data['primaryRoleId'] = this.primaryRoleId;
    data['userId'] = this.userId;
    data['userAttribute'] = this.userAttribute;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['termsConditionsAcceptance'] = this.termsConditionsAcceptance;
    return data;
  }
}
