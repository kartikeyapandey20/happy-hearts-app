class SignUpModel {
  bool? isSuccess;
  String? message;
  Data? data;

  SignUpModel({this.isSuccess, this.message, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    message = json['message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? child;
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
    child = json['child'];
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
    data['child'] = this.child;
    data['subscription'] = this.subscription;
    data['__v'] = this.iV;
    return data;
  }
}
