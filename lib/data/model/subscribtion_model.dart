class SubscriptionModel {
  bool? isSuccess;
  int? count;
  List<Data>? data;
  String? message;

  SubscriptionModel({this.isSuccess, this.count, this.data, this.message});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
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
  String? subscriptionName;
  String? subscriptionDescription;
  int? price;
  List<String>? category;
  int? duration;
  int? iV;

  Data(
      {this.sId,
        this.subscriptionName,
        this.subscriptionDescription,
        this.price,
        this.category,
        this.duration,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subscriptionName = json['subscriptionName'];
    subscriptionDescription = json['subscriptionDescription'];
    price = json['price'];
    category = json['category'].cast<String>();
    duration = json['duration'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subscriptionName'] = this.subscriptionName;
    data['subscriptionDescription'] = this.subscriptionDescription;
    data['price'] = this.price;
    data['category'] = this.category;
    data['duration'] = this.duration;
    data['__v'] = this.iV;
    return data;
  }
}
