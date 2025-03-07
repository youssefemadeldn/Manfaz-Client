class ParametersServiceModel {
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
  int? rating;
  int? ratingCount;
  List<Faqs>? faqs;
  List<String>? whatIncluded;
  String? createdAt;
  String? updatedAt;

  ParametersServiceModel(
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
      this.updatedAt});

  ParametersServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    iconUrl = json['iconUrl'];
    price = json['price'];
    warranty = json['warranty'];
    installmentAvailable = json['installmentAvailable'];
    installmentMonths = json['installmentMonths'];
    monthlyInstallment = json['monthlyInstallment'];
    serviceId = json['serviceId'];
    status = json['status'];
    sortOrder = json['sortOrder'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    whatIncluded = json['whatIncluded'].cast<String>();
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
