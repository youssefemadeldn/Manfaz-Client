class BaseUser {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? imageUrl;
  bool? isVerified;
  String? role;

  BaseUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.imageUrl,
    this.isVerified,
    this.role,
  });

  BaseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    isVerified = json['isVerified'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['imageUrl'] = this.imageUrl;
    data['isVerified'] = this.isVerified;
    data['role'] = this.role;
    return data;
  }
}

class CustomerUser extends BaseUser {
  CustomerUser({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? imageUrl,
    bool? isVerified,
    String? role,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          imageUrl: imageUrl,
          isVerified: isVerified,
          role: role,
        );

  CustomerUser.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class ProviderUser extends BaseUser {
  String? title;
  String? description;
  bool? isAvailable;
  bool? isFavorite;
  double? hourlyRate;
  double? jobSuccessRate;
  double? totalEarned;
  List<String>? skills;
  double? rating;
  int? reviewsCount;
  int? totalJobsDone;
  String? about;

  ProviderUser({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? imageUrl,
    bool? isVerified,
    this.title,
    this.description,
    this.isAvailable,
    this.isFavorite,
    this.hourlyRate,
    this.jobSuccessRate,
    this.totalEarned,
    this.skills,
    this.rating,
    this.reviewsCount,
    this.totalJobsDone,
    this.about,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          imageUrl: imageUrl,
          isVerified: isVerified,
        );

  ProviderUser.fromJson(Map<String, dynamic> json) : super.fromJson(json['user'] ?? {}) {
    title = json['title'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    isFavorite = json['isFavorite'];
    hourlyRate = json['hourlyRate']?.toDouble();
    jobSuccessRate = json['jobSuccessRate']?.toDouble();
    totalEarned = json['totalEarned']?.toDouble();
    skills = json['skills']?.cast<String>();
    rating = json['rating']?.toDouble();
    reviewsCount = json['reviewsCount'];
    totalJobsDone = json['totalJobsDone'];
    about = json['about'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['title'] = title;
    data['description'] = description;
    data['isAvailable'] = isAvailable;
    data['isFavorite'] = isFavorite;
    data['hourlyRate'] = hourlyRate;
    data['jobSuccessRate'] = jobSuccessRate;
    data['totalEarned'] = totalEarned;
    data['skills'] = skills;
    data['rating'] = rating;
    data['reviewsCount'] = reviewsCount;
    data['totalJobsDone'] = totalJobsDone;
    data['about'] = about;
    return data;
  }
}

class DeliveryDriverUser extends BaseUser {
  bool? isOnline;
  double? currentLatitude;
  double? currentLongitude;
  String? vehicleType;
  String? vehiclePlateNumber;
  double? rating;
  int? completedDeliveries;

  DeliveryDriverUser({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? imageUrl,
    bool? isVerified,
    this.isOnline,
    this.currentLatitude,
    this.currentLongitude,
    this.vehicleType,
    this.vehiclePlateNumber,
    this.rating,
    this.completedDeliveries,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          imageUrl: imageUrl,
          isVerified: isVerified,
        );

  DeliveryDriverUser.fromJson(Map<String, dynamic> json) : super.fromJson(json['user'] ?? {}) {
    isOnline = json['isOnline'];
    currentLatitude = json['currentLatitude']?.toDouble();
    currentLongitude = json['currentLongitude']?.toDouble();
    vehicleType = json['vehicleType'];
    vehiclePlateNumber = json['vehiclePlateNumber'];
    rating = json['rating']?.toDouble();
    completedDeliveries = json['completedDeliveries'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['isOnline'] = isOnline;
    data['currentLatitude'] = currentLatitude;
    data['currentLongitude'] = currentLongitude;
    data['vehicleType'] = vehicleType;
    data['vehiclePlateNumber'] = vehiclePlateNumber;
    data['rating'] = rating;
    data['completedDeliveries'] = completedDeliveries;
    return data;
  }
}

class BaseCategory {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? iconUrl;
  double? price;
  int? warranty;
  bool? installmentAvailable;
  int? installmentMonths;
  double? monthlyInstallment;
  String? serviceId;
  String? status;
  int? sortOrder;
  double? rating;
  int? ratingCount;
  int? duration;
  int? availability;
  List<Faqs>? faqs;
  List<String>? whatIncluded;
  String? createdAt;
  String? updatedAt;

  BaseCategory({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.iconUrl,
    this.price,
    this.warranty,
    this.installmentAvailable,
    this.installmentMonths,
    this.monthlyInstallment,
    this.serviceId,
    this.status,
    this.sortOrder,
    this.rating,
    this.ratingCount,
    this.duration,
    this.availability,
    this.faqs,
    this.whatIncluded,
    this.createdAt,
    this.updatedAt,
  });

  BaseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    iconUrl = json['iconUrl'];
    price = json['price']?.toDouble();
    warranty = json['warranty'];
    installmentAvailable = json['installmentAvailable'];
    installmentMonths = json['installmentMonths'];
    monthlyInstallment = json['monthlyInstallment']?.toDouble();
    serviceId = json['serviceId'];
    status = json['status'];
    sortOrder = json['sortOrder'];
    rating = json['rating']?.toDouble();
    ratingCount = json['ratingCount'];
    duration = json['duration'];
    availability = json['availability'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
    whatIncluded = json['whatIncluded']?.cast<String>() ?? [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['iconUrl'] = this.iconUrl;
    data['price'] = this.price;
    data['warranty'] = this.warranty;
    data['installmentAvailable'] = this.installmentAvailable;
    data['installmentMonths'] = this.installmentMonths;
    data['monthlyInstallment'] = this.monthlyInstallment;
    data['serviceId'] = this.serviceId;
    data['status'] = this.status;
    data['sortOrder'] = this.sortOrder;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['duration'] = this.duration;
    data['availability'] = this.availability;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    data['whatIncluded'] = this.whatIncluded;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Faqs {
  String? question;
  String? answer;

  Faqs({this.question, this.answer});

  Faqs.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}

class BaseStore {
  String? id;
  String? name;
  String? logo;

  BaseStore({this.id, this.name, this.logo});

  BaseStore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

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
  List<Order>? orders;
  int? totalOrders;
  int? totalPages;
  int? currentPage;

  Data({this.orders, this.totalOrders, this.totalPages, this.currentPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(new Order.fromJson(v));
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

class Order {
  String? id;
  String? userId;
  String? serviceId;
  String? providerId;
  String? deliveryDriverId;
  double? latitude;
  double? longitude;
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
  BaseCategory? service;
  ProviderUser? provider;
  DeliveryDriverUser? deliveryDriver;
  List<BaseStore>? store;
  CustomerUser? user;

  Order({
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
    this.user,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    serviceId = json['serviceId'];
    providerId = json['providerId'];
    deliveryDriverId = json['deliveryDriverId'];
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
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
    service = json['service'] != null ? BaseCategory.fromJson(json['service']) : null;
    provider = json['provider'] != null ? ProviderUser.fromJson(json['provider']) : null;
    deliveryDriver = json['deliveryDriver'] != null ? DeliveryDriverUser.fromJson(json['deliveryDriver']) : null;
    if (json['store'] != null) {
      store = <BaseStore>[];
      json['store'].forEach((v) {
        store!.add(BaseStore.fromJson(v));
      });
    }
    user = json['user'] != null ? CustomerUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['serviceId'] = serviceId;
    data['providerId'] = providerId;
    data['deliveryDriverId'] = deliveryDriverId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['notes'] = notes;
    data['price'] = price;
    data['duration'] = duration;
    data['status'] = status;
    data['totalAmount'] = totalAmount;
    data['paymentStatus'] = paymentStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['paymentMethod'] = paymentMethod;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    if (deliveryDriver != null) {
      data['deliveryDriver'] = deliveryDriver!.toJson();
    }
    if (store != null) {
      data['store'] = store!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
