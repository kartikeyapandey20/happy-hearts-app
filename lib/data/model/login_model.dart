class LoginModel {
  bool? isSuccess;
  int? count;
  List<Data>? data;
  String? message;

  LoginModel({this.isSuccess, this.count, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['count'] = this.count;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  Child? child;
  // ignore: unnecessary_question_mark
  Null? subscription;
  int? iV;

  Data(
      {this.sId,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.email,
        this.child,
        this.subscription,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    child = json['child'] != null ? new Child.fromJson(json['child']) : null;
    subscription = json['subscription'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    if (this.child != null) {
      data['child'] = this.child!.toJson();
    }
    data['subscription'] = this.subscription;
    data['__v'] = this.iV;
    return data;
  }
}

class Child {
  String? sId;
  String? childName;
  int? status;
  String? userId;
  int? iV;

  Child({this.sId, this.childName, this.status, this.userId, this.iV});

  Child.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    childName = json['childName'];
    status = json['status'];
    userId = json['userId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['childName'] = this.childName;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    return data;
  }
}
