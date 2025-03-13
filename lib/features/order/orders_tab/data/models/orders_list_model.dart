class OrdersListModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  OrdersListModel({this.status, this.message, this.code, this.data});

  OrdersListModel.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;
  int? totalOrders;
  int? totalPages;
  String? currentPage;

  Data({this.orders, this.totalOrders, this.totalPages, this.currentPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    totalOrders = json['totalOrders'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['totalOrders'] = this.totalOrders;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class Orders {
  String? id;
  String? userId;
  String? serviceId;
  String? providerId;
  String? deliveryDriverId;
  String? latitude;
  String? longitude;
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
  Service? service;
  Provider? provider;
  DeliveryDriver? deliveryDriver;
  List<Stores>? store;

  Orders({
    this.id,
    this.userId,
    this.serviceId,
    this.providerId,
    this.deliveryDriverId,
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
    this.service,
    this.provider,
    this.deliveryDriver,
    this.store,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    serviceId = json['serviceId'];
    providerId = json['providerId'];
    deliveryDriverId = json['deliveryDriverId'];
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
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    deliveryDriver = json['deliveryDriver'] != null
        ? new DeliveryDriver.fromJson(json['deliveryDriver'])
        : null;
    if (json['store'] != null) {
      store = <Stores>[];
      json['store'].forEach((v) {
        store!.add(new Stores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['serviceId'] = this.serviceId;
    data['providerId'] = this.providerId;
    data['deliveryDriverId'] = this.deliveryDriverId;
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
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    if (this.deliveryDriver != null) {
      data['deliveryDriver'] = this.deliveryDriver!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Service {
  String? id;
  String? name;

  Service({
    this.id,
    this.name,
  });

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Provider {
  String? id;
  String? userId;

  Provider({
    this.id,
    this.userId,
  });

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    return data;
  }
}

class DeliveryDriver {
  String? id;
  String? userId;
  String? vehicleType;
  String? license;
  bool? availability;
  double? rating;
  int? reviewsCount;
  int? completedOrders;
  double? earnings;
  String? createdAt;
  String? updatedAt;

  DeliveryDriver({
    this.id,
    this.userId,
    this.vehicleType,
    this.license,
    this.availability,
    this.rating,
    this.reviewsCount,
    this.completedOrders,
    this.earnings,
    this.createdAt,
    this.updatedAt,
  });

  DeliveryDriver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    vehicleType = json['vehicleType'];
    license = json['license'];
    availability = json['availability'];
    rating = json['rating']?.toDouble();
    reviewsCount = json['reviewsCount'];
    completedOrders = json['completedOrders'];
    earnings = json['earnings']?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['vehicleType'] = this.vehicleType;
    data['license'] = this.license;
    data['availability'] = this.availability;
    data['rating'] = this.rating;
    data['reviewsCount'] = this.reviewsCount;
    data['completedOrders'] = this.completedOrders;
    data['earnings'] = this.earnings;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Stores {
  String? id;
  String? name;
  Stores({
    this.id,
    this.name,
  });

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
// deliver driver name
// provider name
