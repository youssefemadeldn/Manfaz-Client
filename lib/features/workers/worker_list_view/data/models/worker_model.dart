class WorkerModel {
  // worker card item data
  final String id; // Unique worker ID
  final String name; // Worker's full name
  final String title; // Job title (e.g. "UX Designer")
  final String description; // Brief work experience
  final String location; // Worker's location (e.g. "New York, USA")
  final String profileImage; // Profile photo URL
  final bool isAvailable; // Online status
  final bool isFavorite; // Saved to favorites
  final double hourlyRate; // Price per hour in USD
  final double jobSuccessRate; // Success rate (0-100%)
  final double totalEarned; // Total earnings in USD
  final List<String> skills; // List of expertise areas

  // Additional profile data
  final bool isVerified; // Worker verification badge status
  final int totalJobsDone; // Total number of completed projects
  final String about; // Detailed professional summary
  final List<WorkExperience> experiences; // Work history and past positions
  final List<Review> reviews; // Client reviews and feedback

  const WorkerModel({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.location,
    required this.profileImage,
    required this.isAvailable,
    this.isFavorite = false,
    required this.hourlyRate,
    required this.jobSuccessRate,
    required this.totalEarned,
    required this.skills,
    required this.isVerified,
    required this.totalJobsDone,
    required this.about,
    required this.experiences,
    required this.reviews,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      profileImage: json['profileImage'] as String,
      isAvailable: json['isAvailable'] as bool,
      isFavorite: json['isFavorite'] as bool,
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      jobSuccessRate: (json['jobSuccessRate'] as num).toDouble(),
      totalEarned: (json['totalEarned'] as num).toDouble(),
      skills: List<String>.from(json['skills'] as List),
      isVerified: json['isVerified'] as bool,
      totalJobsDone: json['totalJobsDone'] as int,
      about: json['about'] as String,
      experiences: (json['experiences'] as List)
          .map((e) => WorkExperience.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'location': location,
      'profileImage': profileImage,
      'isAvailable': isAvailable,
      'isFavorite': isFavorite,
      'hourlyRate': hourlyRate,
      'jobSuccessRate': jobSuccessRate,
      'totalEarned': totalEarned,
      'skills': skills,
      'isVerified': isVerified,
      'totalJobsDone': totalJobsDone,
      'about': about,
      'experiences': experiences.map((e) => e.toJson()).toList(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}

class WorkExperience {
  final String title; // Job position or role
  final String company; // Company or organization name
  final String duration; // Employment period (e.g. "2020-2023")
  final String description; // Role responsibilities and achievements

  const WorkExperience({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      title: json['title'] as String,
      company: json['company'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company': company,
      'duration': duration,
      'description': description,
    };
  }
}

class Review {
  final String id;
  final String reviewerName;
  final String reviewerImage;
  final double rating;
  final String comment;
  final DateTime date;

  const Review({
    required this.id,
    required this.reviewerName,
    required this.reviewerImage,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      reviewerName: json['reviewerName'] as String,
      reviewerImage: json['reviewerImage'] as String,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewerName': reviewerName,
      'reviewerImage': reviewerImage,
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }
}
