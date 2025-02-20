class ServicesBasedOnCategoryModel {
  bool? status;
  String? message;
  int? code;
  List<ServiceModel>? data;

  ServicesBasedOnCategoryModel({this.status, this.message, this.code, this.data});

  ServicesBasedOnCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <ServiceModel>[];
      json['data'].forEach((v) {
        data!.add(new ServiceModel.fromJson(v));
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

class ServiceModel {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? categoryId;
  String? type;
  double? price;
  int? duration;
  bool? availability;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  ServiceModel(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.categoryId,
      this.type,
      this.price,
      this.duration,
      this.availability,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    categoryId = json['categoryId'];
    type = json['type'];
    price = json['price'].toDouble();
    duration = json['duration'];
    availability = json['availability'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['type'] = this.type;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['availability'] = this.availability;
    data['imageUrl'] = this.imageUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
