class StoreSubCategoriesList {
  bool? status;
  String? message;
  int? code;
  List<StoreSubCategory>? data;

  StoreSubCategoriesList({this.status, this.message, this.code, this.data});

  StoreSubCategoriesList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StoreSubCategory>[];
      json['data'].forEach((v) {
        data!.add(new StoreSubCategory.fromJson(v));
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

class StoreSubCategory {
  String? id;
  String? storeId;
  String? name;
  String? description;
  String? image;
  bool? isActive;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;

  StoreSubCategory(
      {this.id,
      this.storeId,
      this.name,
      this.description,
      this.image,
      this.isActive,
      this.sortOrder,
      this.createdAt,
      this.updatedAt});

  StoreSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    isActive = json['isActive'];
    sortOrder = json['sortOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storeId'] = this.storeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    data['sortOrder'] = this.sortOrder;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
