class HomeTabModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  HomeTabModel({this.status, this.message, this.code, this.data});

  HomeTabModel.fromJson(Map<String, dynamic> json) {
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
  List<CategoryModel>? categories;
  int? totalCategories;
  int? currentPage;
  int? totalPages;

  Data(
      {this.categories,
      this.totalCategories,
      this.currentPage,
      this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(new CategoryModel.fromJson(v));
      });
    }
    totalCategories = json['totalCategories'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['totalCategories'] = this.totalCategories;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class CategoryModel {
  String? id;
  String? name;
  String? subName;
  String? slug;
  String? description;
  String? info;
  int? price;
  String? imageUrl;
  String? type;
  String? subType;
  String? status;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;
  List<Services>? services;

  CategoryModel(
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
      this.updatedAt,
      this.services,
});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
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
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Services {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? categoryId;
  String? type;
  String? subType;
  double? price;
  int? duration;
  bool? availability;
  String? imageUrl;
  String? iconUrl;
  int? rating;
  int? ratingCount;
  String? warranty;
  bool? installmentAvailable;
  String? installmentMonths;
  String? monthlyInstallment;
  String? createdAt;
  String? updatedAt;

  Services(
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
      this.updatedAt});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    categoryId = json['categoryId'];
    type = json['type'];
    subType = json['subType'];
    price = json['price']?.toDouble();
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
    return data;
  }
}

