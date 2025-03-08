class ParametersServicesListModel {
  bool? status;
  String? message;
  int? code;
  List<ParametersServiceDetailsModel>? data;

  ParametersServicesListModel(
      {this.status, this.message, this.code, this.data});

  ParametersServicesListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <ParametersServiceDetailsModel>[];
      json['data'].forEach((v) {
        data!.add(new ParametersServiceDetailsModel.fromJson(v));
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

class ParametersServiceDetailsModel {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? iconUrl;
  int? price;
  int? warranty;
  bool? installmentAvailable;
  int? installmentMonths;
  double? monthlyInstallment;
  String? serviceId;
  String? status;
  int? sortOrder;
  bool? availability;
  int? duration;
  int? rating;
  int? ratingCount;
  List<Faqs>? faqs;
  List<String>? whatIncluded;
  String? createdAt;
  String? updatedAt;

  ParametersServiceDetailsModel(
      {this.id,
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
      this.faqs,
      this.whatIncluded,
      this.createdAt,
      this.updatedAt,
      this.availability,
      this.duration});

  ParametersServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    iconUrl = json['iconUrl'];
    price = json['price'];
    warranty = json['warranty'];
    installmentAvailable = json['installmentAvailable'];
    installmentMonths = json['installmentMonths'];
    monthlyInstallment = json['monthlyInstallment']?.toDouble() ?? 0.0;
    serviceId = json['serviceId'];
    status = json['status'];
    availability = json['availability'] ?? true;
    duration = json['duration'] ?? 0;
    sortOrder = json['sortOrder'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    if (json['whatIncluded'] != null) {
      whatIncluded = json['whatIncluded'].cast<String>();
    }
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
    data['availability'] = this.availability;
    data['duration'] = this.duration;
    data['ratingCount'] = this.ratingCount;
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
