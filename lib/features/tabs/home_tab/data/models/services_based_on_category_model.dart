class ServicesBasedOnCategoryModel {
  bool? status;
  String? message;
  int? code;
  List<ServiceModel>? data;

  ServicesBasedOnCategoryModel(
      {this.status, this.message, this.code, this.data});

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
  String? iconUrl;
  int? rating;
  int? ratingCount;
  int? warranty;
  bool? installmentAvailable;
  int? installmentMonths;
  double? monthlyInstallment;
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
      this.iconUrl,
      this.rating,
      this.ratingCount,
      this.warranty,
      this.installmentAvailable,
      this.installmentMonths,
      this.monthlyInstallment,
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
    iconUrl = json['iconUrl'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    warranty = json['warranty'];
    installmentAvailable = json['installmentAvailable'];
    installmentMonths = json['installmentMonths'];
    monthlyInstallment = json['monthlyInstallment'];
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
    data['iconUrl'] = this.iconUrl;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['warranty'] = this.warranty;
    data['installmentAvailable'] = this.installmentAvailable;
    data['installmentMonths'] = this.installmentMonths;
    data['monthlyInstallment'] = this.monthlyInstallment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
