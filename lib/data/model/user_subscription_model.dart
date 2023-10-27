class UserSubscriptionModel {
  bool? isSuccess;
  List<Data>? data;
  String? message;

  UserSubscriptionModel({this.isSuccess, this.data, this.message});

  UserSubscriptionModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
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
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  String? userId;
  Subscription? subscription;
  String? buyDate;
  String? expDate;

  Data({this.userId, this.subscription, this.buyDate, this.expDate});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    buyDate = json['buyDate'];
    expDate = json['expDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    data['buyDate'] = this.buyDate;
    data['expDate'] = this.expDate;
    return data;
  }
}

class Subscription {
  String? sId;
  String? subscriptionName;
  String? subscriptionDescription;
  int? price;
  List<Category>? category;
  int? duration;
  int? iV;

  Subscription(
      {this.sId,
        this.subscriptionName,
        this.subscriptionDescription,
        this.price,
        this.category,
        this.duration,
        this.iV});

  Subscription.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subscriptionName = json['subscriptionName'];
    subscriptionDescription = json['subscriptionDescription'];
    price = json['price'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    duration = json['duration'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subscriptionName'] = this.subscriptionName;
    data['subscriptionDescription'] = this.subscriptionDescription;
    data['price'] = this.price;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    data['duration'] = this.duration;
    data['__v'] = this.iV;
    return data;
  }
}

class Category {
  String? sId;
  String? categoryName;
  List<Audios>? audios;
  int? iV;

  Category({this.sId, this.categoryName, this.audios, this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['categoryName'];
    if (json['audios'] != null) {
      audios = <Audios>[];
      json['audios'].forEach((v) {
        audios!.add(new Audios.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categoryName'] = this.categoryName;
    if (this.audios != null) {
      data['audios'] = this.audios!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Audios {
  String? sId;
  String? audioName;
  String? audioUrl;
  String? imageUrl;
  String? audioDuration;
  List<String>? audioDiscription;
  int? iV;

  Audios(
      {this.sId,
        this.audioName,
        this.audioUrl,
        this.imageUrl,
        this.audioDuration,
        this.audioDiscription,
        this.iV});

  Audios.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    audioName = json['audioName'];
    audioUrl = json['audioUrl'];
    imageUrl = json['imageUrl'];
    audioDuration = json['audioDuration'];
    audioDiscription = json['audioDiscription'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['audioName'] = this.audioName;
    data['audioUrl'] = this.audioUrl;
    data['imageUrl'] = this.imageUrl;
    data['audioDuration'] = this.audioDuration;
    data['audioDiscription'] = this.audioDiscription;
    data['__v'] = this.iV;
    return data;
  }
}
