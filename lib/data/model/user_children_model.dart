class UserChildrenModel {
  bool? isSuccess;
  int? count;
  List<Data>? data;

  UserChildrenModel({this.isSuccess, this.count, this.data});

  UserChildrenModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['count'] = this.count;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? childName;
  int? status;
  String? userId;
  int? iV;

  Data({this.sId, this.childName, this.status, this.userId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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
