class ResendVerificationCodeModel {
  bool? status;
  String? message;
  int? code;

  ResendVerificationCodeModel({this.status, this.message, this.code});

  ResendVerificationCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}
