class PurchaseModel {
  bool? isSuccess;
  Data? data;
  String? message;

  PurchaseModel({this.isSuccess, this.data, this.message});

  PurchaseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? userId;
  String? childId;
  String? audioId;
  String? duration;
  String? buyDate;
  String? expDate;
  bool? isFavourite;
  String? paymentId;
  String? sId;
  int? iV;

  Data(
      {this.userId,
        this.childId,
        this.audioId,
        this.duration,
        this.buyDate,
        this.expDate,
        this.isFavourite,
        this.paymentId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    childId = json['childId'];
    audioId = json['audioId'];
    duration = json['duration'];
    buyDate = json['buyDate'];
    expDate = json['expDate'];
    isFavourite = json['isFavourite'];
    paymentId = json['paymentId'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['childId'] = this.childId;
    data['audioId'] = this.audioId;
    data['duration'] = this.duration;
    data['buyDate'] = this.buyDate;
    data['expDate'] = this.expDate;
    data['isFavourite'] = this.isFavourite;
    data['paymentId'] = this.paymentId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
