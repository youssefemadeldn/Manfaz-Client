class GetUserProfile {
  bool? status;
  String? message;
  int? code;
  Data? data;

  GetUserProfile({this.status, this.message, this.code, this.data});

  GetUserProfile.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? phone;
  String? password;
  String? imageUrl;
  String? token;
  bool? isVerified;
  String? role;
  int? verificationCode;
  String? createdAt;
  String? updatedAt;
  List<UserLocation>? locations;
  List<Wallet>? wallet;
  List<Order>? order;
  int? totalOrders;
  int? totalReviews;
  int? totalEarnings;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.imageUrl,
      this.token,
      this.isVerified,
      this.role,
      this.verificationCode,
      this.createdAt,
      this.updatedAt,
      this.locations,
      this.wallet,
      this.order,
      this.totalOrders,
      this.totalReviews,
      this.totalEarnings});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    imageUrl = json['imageUrl'];
    token = json['token'];
    isVerified = json['isVerified'];
    role = json['role'];
    verificationCode = json['verificationCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['locations'] != null) {
      locations = <UserLocation>[];
      json['locations'].forEach((v) {
        locations!.add(UserLocation.fromJson(v));
      });
    }
    if (json['Wallet'] != null) {
      wallet = <Wallet>[];
      json['Wallet'].forEach((v) {
        wallet!.add(Wallet.fromJson(v));
      });
    }
    if (json['Order'] != null) {
      order = <Order>[];
      json['Order'].forEach((v) {
        order!.add(Order.fromJson(v));
      });
    }
    totalOrders = json['totalOrders'];
    totalReviews = json['totalReviews'];
    totalEarnings = json['totalEarnings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['imageUrl'] = this.imageUrl;
    data['token'] = this.token;
    data['isVerified'] = this.isVerified;
    data['role'] = this.role;
    data['verificationCode'] = this.verificationCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.wallet != null) {
      data['Wallet'] = this.wallet!.map((v) => v.toJson()).toList();
    }
    if (this.order != null) {
      data['Order'] = this.order!.map((v) => v.toJson()).toList();
    }
    data['totalOrders'] = this.totalOrders;
    data['totalReviews'] = this.totalReviews;
    data['totalEarnings'] = this.totalEarnings;
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

  Order(
      {this.id,
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
      this.paymentMethod});

  Order.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class UserLocation {
  String? id;
  String? userId;
  String? name;
  String? address;
  String? apartment;
  String? floor;
  String? building;
  String? street;
  String? area;
  String? city;
  double? latitude;
  double? longitude;
  bool? isDefault;
  String? type;
  String? notes;
  String? createdAt;
  String? updatedAt;

  UserLocation({
    this.id,
    this.userId,
    this.name,
    this.address,
    this.apartment,
    this.floor,
    this.building,
    this.street,
    this.area,
    this.city,
    this.latitude,
    this.longitude,
    this.isDefault,
    this.type,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  UserLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    address = json['address'];
    apartment = json['apartment'];
    floor = json['floor'];
    building = json['building'];
    street = json['street'];
    area = json['area'];
    city = json['city'];
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
    isDefault = json['isDefault'];
    type = json['type'];
    notes = json['notes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['apartment'] = this.apartment;
    data['floor'] = this.floor;
    data['building'] = this.building;
    data['street'] = this.street;
    data['area'] = this.area;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isDefault'] = this.isDefault;
    data['type'] = this.type;
    data['notes'] = this.notes;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Wallet {
  String? id;
  String? userId;
  double? balance;
  List<Transaction>? transactions;
  String? createdAt;
  String? updatedAt;

  Wallet({
    this.id,
    this.userId,
    this.balance,
    this.transactions,
    this.createdAt,
    this.updatedAt,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    balance = json['balance']?.toDouble();
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transaction.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['balance'] = this.balance;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Transaction {
  String? id;
  String? walletId;
  String? type;
  double? amount;
  String? status;
  String? createdAt;
  String? updatedAt;

  Transaction({
    this.id,
    this.walletId,
    this.type,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    walletId = json['walletId'];
    type = json['type'];
    amount = json['amount']?.toDouble();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['walletId'] = this.walletId;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
