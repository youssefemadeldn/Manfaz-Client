class HomeTabModel {
  bool? status;
  String? message;
  int? code;
  List<CategoryModel>? data;

  HomeTabModel({this.status, this.message, this.code, this.data});

  HomeTabModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <CategoryModel>[];
      json['data'].forEach((v) {
        data!.add(new CategoryModel.fromJson(v));
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

  CategoryModel({
    this.id,
    this.name,
    this.subName,
    this.slug,
    this.description,
    this.info,
    this.price,
    this.imageUrl,
    this.type,
    this.status,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.subType,
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
