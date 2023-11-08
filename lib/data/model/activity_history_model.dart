class ActivityHistoryModel {
  bool? isSuccess;
  List<Data>? data;
  String? message;

  ActivityHistoryModel({this.isSuccess, this.data, this.message});

  ActivityHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? userId;
  String? childId;
  AudioId? audioId;
  int? iV;

  Data({this.sId, this.userId, this.childId, this.audioId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    childId = json['childId'];
    audioId =
    json['audioId'] != null ? new AudioId.fromJson(json['audioId']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['childId'] = this.childId;
    if (this.audioId != null) {
      data['audioId'] = this.audioId!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class AudioId {
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

  AudioId(
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

  AudioId.fromJson(Map<String, dynamic> json) {
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
