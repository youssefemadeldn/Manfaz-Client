class ParametersServicesListModel {
  bool? status;
  String? message;
  int? code;
  List<ParametersServiceModel>? data;

  ParametersServicesListModel(
      {this.status, this.message, this.code, this.data});

  ParametersServicesListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <ParametersServiceModel>[];
      json['data'].forEach((v) {
        data!.add(new ParametersServiceModel.fromJson(v));
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

class ParametersServiceModel {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? categoryId;
  String? type;
  Null? subType;
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
  Category? category;

  ParametersServiceModel(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.categoryId,
      this.type,
      this.subType,
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
      this.updatedAt,
      this.category});

  ParametersServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    categoryId = json['categoryId'];
    type = json['type'];
    subType = json['subType'];
    price = json['price']?.toDouble() ?? 0;
    duration = json['duration'];
    availability = json['availability'];
    imageUrl = json['imageUrl'];
    iconUrl = json['iconUrl'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    warranty = json['warranty']?.toInt() ?? 0;
    installmentAvailable = json['installmentAvailable'];
    installmentMonths = json['installmentMonths']?.toInt() ?? 0;
    monthlyInstallment = json['monthlyInstallment']?.toDouble()??0;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['type'] = this.type;
    data['subType'] = this.subType;
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
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? subName;
  String? slug;
  String? description;
  String? info;
  int? price;
  String? imageUrl;
  String? type;
  Null? subType;
  String? status;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.name,
      this.subName,
      this.slug,
      this.description,
      this.info,
      this.price,
      this.imageUrl,
      this.type,
      this.subType,
      this.status,
      this.sortOrder,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['subName'];
    slug = json['slug'];
    description = json['description'];
    info = json['info'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    subType = json['subType'];
    status = json['status'];
    sortOrder = json['sortOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['subName'] = this.subName;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['info'] = this.info;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['type'] = this.type;
    data['subType'] = this.subType;
    data['status'] = this.status;
    data['sortOrder'] = this.sortOrder;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
