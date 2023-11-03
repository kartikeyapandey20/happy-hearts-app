class AudioStatusModel {
  bool? isSuccess;
  Data? data;
  String? message;

  AudioStatusModel({this.isSuccess, this.data, this.message});

  AudioStatusModel.fromJson(Map<String, dynamic> json) {
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
  bool? audioPurchase;

  Data({this.audioPurchase});

  Data.fromJson(Map<String, dynamic> json) {
    audioPurchase = json['audioPurchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audioPurchase'] = this.audioPurchase;
    return data;
  }
}
