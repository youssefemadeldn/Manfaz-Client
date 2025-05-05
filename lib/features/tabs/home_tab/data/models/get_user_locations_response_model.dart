class GetUserLocationsResponseModel {
  bool? status;
  String? message;
  int? code;
  List<Data>? data;

  GetUserLocationsResponseModel(
      {this.status, this.message, this.code, this.data});

  GetUserLocationsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? name;
  String? address;
  String? apartment;
  String? floor;
  String? building;
  String? street;
  String? area;
  String? city;
  double? latitude;
  double? longitude;
  bool? isDefault;
  String? type;
  String? notes;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.apartment,
      this.floor,
      this.building,
      this.street,
      this.area,
      this.city,
      this.latitude,
      this.longitude,
      this.isDefault,
      this.type,
      this.notes,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    address = json['address'];
    apartment = json['apartment'];
    floor = json['floor'];
    building = json['building'];
    street = json['street'];
    area = json['area'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['isDefault'];
    type = json['type'];
    notes = json['notes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['apartment'] = this.apartment;
    data['floor'] = this.floor;
    data['building'] = this.building;
    data['street'] = this.street;
    data['area'] = this.area;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isDefault'] = this.isDefault;
    data['type'] = this.type;
    data['notes'] = this.notes;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
