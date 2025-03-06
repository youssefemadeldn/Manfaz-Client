class WorkerListModel {
  bool? status;
  String? message;
  int? code;
  List<WorkerLite>? data;

  WorkerListModel({this.status, this.message, this.code, this.data});

  WorkerListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <WorkerLite>[];
      json['data'].forEach((v) {
        data!.add(new WorkerLite.fromJson(v));
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

class WorkerLite {
  String? id;
  String? userId;
  String? title;
  String? description;
  String? profileImage;
  bool? isAvailable;
  bool? isFavorite;
  int? hourlyRate;
  int? jobSuccessRate;
  int? totalEarned;
  List<String>? skills;
  int? rating;
  int? reviewsCount;
  String? createdAt;
  String? updatedAt;
  Info? user;

  WorkerLite(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.profileImage,
      this.isAvailable,
      this.isFavorite,
      this.hourlyRate,
      this.jobSuccessRate,
      this.totalEarned,
      this.skills,
      this.rating,
      this.reviewsCount,
      this.createdAt,
      this.updatedAt,
      this.user});

  WorkerLite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    description = json['description'];
    profileImage = json['profileImage'];
    isAvailable = json['isAvailable'];
    isFavorite = json['isFavorite'];
    hourlyRate = json['hourlyRate'];
    jobSuccessRate = json['jobSuccessRate'];
    totalEarned = json['totalEarned'];
    skills = json['skills'].cast<String>();
    rating = json['rating'];
    reviewsCount = json['reviewsCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new Info.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['profileImage'] = this.profileImage;
    data['isAvailable'] = this.isAvailable;
    data['isFavorite'] = this.isFavorite;
    data['hourlyRate'] = this.hourlyRate;
    data['jobSuccessRate'] = this.jobSuccessRate;
    data['totalEarned'] = this.totalEarned;
    data['skills'] = this.skills;
    data['rating'] = this.rating;
    data['reviewsCount'] = this.reviewsCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Info {
  String? id;
  String? name;
  List<Locations>? locations;

  Info({this.id, this.name, this.locations});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
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

  Locations(
      {this.id,
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
      this.updatedAt});

  Locations.fromJson(Map<String, dynamic> json) {
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
    latitude = json['latitude'];
    longitude = json['longitude'];
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
