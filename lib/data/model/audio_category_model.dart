class AudioCategoryModel {
  bool? isSuccess;
  int? count;
  List<Data>? data;
  String? message;

  AudioCategoryModel({this.isSuccess, this.count, this.data, this.message});

  AudioCategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? categoryName;
  List<Audios>? audios;
  int? iV;

  Data({this.sId, this.categoryName, this.audios, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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
  List<String>? audioInstruction;
  String? audioName;
  String? audioDiscription;
  String? audioPrice;
  String? audioDuration;
  String? hindiAudioUrl;
  String? englishAudioUrl;
  String? gujaratiAudioUrl;
  String? imageUrl;
  int? iV;
  String? musicName;

  Audios(
      {this.sId,
        this.audioInstruction,
        this.audioName,
        this.audioDiscription,
        this.audioPrice,
        this.audioDuration,
        this.hindiAudioUrl,
        this.englishAudioUrl,
        this.gujaratiAudioUrl,
        this.imageUrl,
        this.iV,
        this.musicName});

  Audios.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    audioInstruction = json['audioInstruction'].cast<String>();
    audioName = json['audioName'];
    audioDiscription = json['audioDiscription'];
    audioPrice = json['audioPrice'];
    audioDuration = json['audioDuration'];
    hindiAudioUrl = json['hindiAudioUrl'];
    englishAudioUrl = json['englishAudioUrl'];
    gujaratiAudioUrl = json['gujaratiAudioUrl'];
    imageUrl = json['imageUrl'];
    iV = json['__v'];
    musicName = json['musicName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['audioInstruction'] = this.audioInstruction;
    data['audioName'] = this.audioName;
    data['audioDiscription'] = this.audioDiscription;
    data['audioPrice'] = this.audioPrice;
    data['audioDuration'] = this.audioDuration;
    data['hindiAudioUrl'] = this.hindiAudioUrl;
    data['englishAudioUrl'] = this.englishAudioUrl;
    data['gujaratiAudioUrl'] = this.gujaratiAudioUrl;
    data['imageUrl'] = this.imageUrl;
    data['__v'] = this.iV;
    data['musicName'] = this.musicName;
    return data;
  }
}
