class StoreListModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  StoreListModel({this.status, this.message, this.code, this.data});

  StoreListModel.fromJson(Map<String, dynamic> json) {
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
  List<Stores>? stores;
  int? totalStores;
  int? currentPage;
  int? totalPages;

  Data({this.stores, this.totalStores, this.currentPage, this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(new Stores.fromJson(v));
      });
    }
    totalStores = json['totalStores'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
    data['totalStores'] = this.totalStores;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Stores {
  String? id;
  String? name;
  String? description;
  String? type;
  String? logo;
  String? coverImage;
  List<String>? images;
  String? address;
  String? phone;
  String? email;
  String? categoryId;
  int? rating;
  int? reviewsCount;
  bool? isActive;
  String? status;
  int? minOrderAmount;
  int? deliveryFee;
  double? priceDriver;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Locations>? locations;
  List<WorkingHours>? workingHours;

  Stores(
      {this.id,
      this.name,
      this.description,
      this.type,
      this.logo,
      this.coverImage,
      this.images,
      this.address,
      this.phone,
      this.email,
      this.categoryId,
      this.rating,
      this.reviewsCount,
      this.isActive,
      this.status,
      this.minOrderAmount,
      this.deliveryFee,
      this.priceDriver,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.locations,
      this.workingHours});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    logo = json['logo'];
    coverImage = json['coverImage'];
    images = json['images'].cast<String>();
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    categoryId = json['categoryId'];
    rating = json['rating'];
    reviewsCount = json['reviewsCount'];
    isActive = json['isActive'];
    status = json['status'];
    minOrderAmount = json['minOrderAmount'];
    deliveryFee = json['deliveryFee'];
    priceDriver = json['priceDriver'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    if (json['workingHours'] != null) {
      workingHours = <WorkingHours>[];
      json['workingHours'].forEach((v) {
        workingHours!.add(new WorkingHours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['logo'] = this.logo;
    data['coverImage'] = this.coverImage;
    data['images'] = this.images;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['categoryId'] = this.categoryId;
    data['rating'] = rating;
    data['reviewsCount'] = this.reviewsCount;
    data['isActive'] = this.isActive;
    data['status'] = this.status;
    data['minOrderAmount'] = this.minOrderAmount;
    data['deliveryFee'] = this.deliveryFee;
    data['priceDriver'] = this.priceDriver;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.workingHours != null) {
      data['workingHours'] = this.workingHours!.map((v) => v.toJson()).toList();
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
  String? subType;
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

class Locations {
  String? id;
  String? storeId;
  String? name;
  String? address;
  double? latitude;
  double? longitude;
  String? phone;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Locations(
      {this.id,
      this.storeId,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.phone,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storeId'] = this.storeId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone'] = this.phone;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class WorkingHours {
  String? id;
  String? storeId;
  int? dayOfWeek;
  bool? isOpen;
  String? openTime;
  String? closeTime;
  String? breakStart;
  String? breakEnd;
  bool? isSpecialDay;
  String? specialDate;
  String? note;
  String? createdAt;
  String? updatedAt;

  WorkingHours(
      {this.id,
      this.storeId,
      this.dayOfWeek,
      this.isOpen,
      this.openTime,
      this.closeTime,
      this.breakStart,
      this.breakEnd,
      this.isSpecialDay,
      this.specialDate,
      this.note,
      this.createdAt,
      this.updatedAt});

  WorkingHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    dayOfWeek = json['dayOfWeek'];
    isOpen = json['isOpen'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    breakStart = json['breakStart'];
    breakEnd = json['breakEnd'];
    isSpecialDay = json['isSpecialDay'];
    specialDate = json['specialDate'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storeId'] = this.storeId;
    data['dayOfWeek'] = this.dayOfWeek;
    data['isOpen'] = this.isOpen;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['breakStart'] = this.breakStart;
    data['breakEnd'] = this.breakEnd;
    data['isSpecialDay'] = this.isSpecialDay;
    data['specialDate'] = this.specialDate;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
