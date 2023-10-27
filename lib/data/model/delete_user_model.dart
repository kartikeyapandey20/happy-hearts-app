class DeleteModel {
  bool? isSuccess;
  String? message;

  DeleteModel({this.isSuccess, this.message});

  DeleteModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['Message'] = this.message;
    return data;
  }
}
