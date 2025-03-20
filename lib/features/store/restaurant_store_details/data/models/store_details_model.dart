class StoreDetailsModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  StoreDetailsModel({this.status, this.message, this.code, this.data});

  StoreDetailsModel.fromJson(Map<String, dynamic> json) {
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
  List<Categories>? categories;
  List<Products>? products;
  List<dynamic>? offers;
  List<Locations>? locations;
  List<WorkingHours>? workingHours;
  List<dynamic>? coupon;
  Category? category;
  List<dynamic>? discount;
  List<dynamic>? giftCard;
  List<dynamic>? reward;
  List<OrdersStore>? ordersStore;

  Data({
    this.id,
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
    this.categories,
    this.products,
    this.offers,
    this.locations,
    this.workingHours,
    this.coupon,
    this.category,
    this.discount,
    this.giftCard,
    this.reward,
    this.ordersStore,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    description = json['description']?.toString();
    type = json['type']?.toString();
    logo = json['logo']?.toString();
    coverImage = json['coverImage']?.toString();
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    address = json['address']?.toString();
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    categoryId = json['categoryId']?.toString();
    rating = json['rating'];
    reviewsCount = json['reviewsCount'];
    isActive = json['isActive'];
    status = json['status']?.toString();
    minOrderAmount = json['minOrderAmount'];
    deliveryFee = json['deliveryFee'];
    priceDriver = json['priceDriver']?.toDouble();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    offers = json['offers'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    if (json['workingHours'] != null) {
      workingHours = <WorkingHours>[];
      json['workingHours'].forEach((v) {
        workingHours!.add(WorkingHours.fromJson(v));
      });
    }
    coupon = json['coupon'] ?? json['Coupon'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    discount = json['discount'] ?? json['Discount'];
    giftCard = json['giftCard'] ?? json['GiftCard'];
    reward = json['reward'] ?? json['Reward'];
    if ((json['ordersStore'] != null) || (json['OrdersStore'] != null)) {
      ordersStore = <OrdersStore>[];
      var ordersList = json['ordersStore'] ?? json['OrdersStore'];
      ordersList.forEach((v) {
        ordersStore!.add(OrdersStore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['logo'] = logo;
    data['coverImage'] = coverImage;
    data['images'] = images;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['categoryId'] = categoryId;
    data['rating'] = rating;
    data['reviewsCount'] = reviewsCount;
    data['isActive'] = isActive;
    data['status'] = status;
    data['minOrderAmount'] = minOrderAmount;
    data['deliveryFee'] = deliveryFee;
    data['priceDriver'] = priceDriver;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['offers'] = offers;
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    if (workingHours != null) {
      data['workingHours'] = workingHours!.map((v) => v.toJson()).toList();
    }
    data['Coupon'] = coupon;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['Discount'] = discount;
    data['GiftCard'] = giftCard;
    data['Reward'] = reward;
    if (ordersStore != null) {
      data['OrdersStore'] = ordersStore!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? storeId;
  String? name;
  String? description;
  List<String>? images;
  bool? isActive;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;

  Categories({
    this.id,
    this.storeId,
    this.name,
    this.description,
    this.images,
    this.isActive,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    name = json['name'];
    description = json['description'];
    images = json['images']?.cast<String>();
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
    data['images'] = this.images;
    data['isActive'] = this.isActive;
    data['sortOrder'] = this.sortOrder;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? description;
  int? price;
  int? salePrice;
  List<String>? images;
  String? storeId;
  String? categoryId;
  bool? isAvailable;
  int? rating;
  List<String>? ingredients;
  Extras? extras;
  int? stock;
  double? discountPrice;
  String? createdAt;
  String? updatedAt;

  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.salePrice,
    this.images,
    this.storeId,
    this.categoryId,
    this.isAvailable,
    this.rating,
    this.ingredients,
    this.extras,
    this.stock,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    salePrice = json['salePrice'];
    images = json['images'].cast<String>();
    storeId = json['storeId'];
    categoryId = json['categoryId'];
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    ingredients = json['ingredients'].cast<String>();
    extras = json['extras'] != null ? new Extras.fromJson(json['extras']) : null;
    stock = json['stock'];
    discountPrice = json['discountPrice']?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['salePrice'] = this.salePrice;
    data['images'] = this.images;
    data['storeId'] = this.storeId;
    data['categoryId'] = this.categoryId;
    data['isAvailable'] = this.isAvailable;
    data['rating'] = this.rating;
    data['ingredients'] = this.ingredients;
    if (this.extras != null) {
      data['extras'] = this.extras!.toJson();
    }
    data['stock'] = this.stock;
    data['discountPrice'] = this.discountPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Extras {
  List<String>? sizes;
  List<Additions>? additions;

  Extras({this.sizes, this.additions});

  Extras.fromJson(Map<String, dynamic> json) {
    sizes = json['sizes'].cast<String>();
    if (json['additions'] != null) {
      additions = <Additions>[];
      json['additions'].forEach((v) {
        additions!.add(new Additions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizes'] = this.sizes;
    if (this.additions != null) {
      data['additions'] = this.additions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Additions {
  String? name;
  int? price;

  Additions({this.name, this.price});

  Additions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
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

  Locations({
    this.id,
    this.storeId,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

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

  WorkingHours({
    this.id,
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
    this.updatedAt,
  });

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
    specialDate = json['specialDate']?.toString();
    note = json['note']?.toString();
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

  Category({
    this.id,
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
  });

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

class OrdersStore {
  String? id;
  String? orderId;
  String? storeId;

  OrdersStore({this.id, this.orderId, this.storeId});

  OrdersStore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    storeId = json['storeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['storeId'] = this.storeId;
    return data;
  }
}
