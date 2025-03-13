class CreateServiceOrderModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  CreateServiceOrderModel({this.status, this.message, this.code, this.data});

  CreateServiceOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? serviceId;
  String? providerId;
  double? latitude;
  double? longitude;
  String? address;
  String? notes;
  int? price;
  int? duration;
  String? status;
  int? totalAmount;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? paymentMethod;

  Data({
    this.id,
    this.userId,
    this.serviceId,
    this.providerId,
    this.latitude,
    this.longitude,
    this.address,
    this.notes,
    this.price,
    this.duration,
    this.status,
    this.totalAmount,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.paymentMethod,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    serviceId = json['serviceId'];
    providerId = json['providerId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    notes = json['notes'];
    price = json['price'];
    duration = json['duration'];
    status = json['status'];
    totalAmount = json['totalAmount'];
    paymentStatus = json['paymentStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    paymentMethod = json['paymentMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['serviceId'] = this.serviceId;
    data['providerId'] = this.providerId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['notes'] = this.notes;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['totalAmount'] = this.totalAmount;
    data['paymentStatus'] = this.paymentStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['paymentMethod'] = this.paymentMethod;
    return data;
  }
}
