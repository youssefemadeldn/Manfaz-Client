class WorkerProfileModel {
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

  // Additional Profile Data
  final String email; // Contact email
  final String phone; // Contact phone number
  final String language; // Primary language
  final double rating; // Overall rating (0-5)
  final int totalReviews; // Number of reviews
  final int completedJobs; // Number of completed jobs
  final int totalHours; // Total hours worked
  final String memberSince; // Join date
  final String lastActive; // Last active timestamp
  final List<Education> education; // Educational background
  final List<WorkExperience> workExperience; // Work history
  final List<Review> reviews; // Client reviews
  final List<String> portfolioImages; // Portfolio images URLs
  final List<Certificate> certificates; // Professional certificates
  final String about; // Detailed about section
  final List<String> languages; // Known languages with proficiency
  final bool isVerified; // Identity verification status
  final Map<String, int> skillLevels; // Skill proficiency levels (0-100)

  const WorkerProfileModel({
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
    required this.email,
    required this.phone,
    required this.language,
    required this.rating,
    required this.totalReviews,
    required this.completedJobs,
    required this.totalHours,
    required this.memberSince,
    required this.lastActive,
    required this.education,
    required this.workExperience,
    required this.reviews,
    required this.portfolioImages,
    required this.certificates,
    required this.about,
    required this.languages,
    required this.isVerified,
    required this.skillLevels,
  });
}

class Education {
  final String degree; // Degree name
  final String institution; // Institution name
  final String startDate; // Start date
  final String endDate; // End date or "Present"
  final String description; // Optional description

  const Education({
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class WorkExperience {
  final String position; // Job position
  final String company; // Company name
  final String startDate; // Start date
  final String endDate; // End date or "Present"
  final String description; // Job description
  final List<String> achievements; // Key achievements

  const WorkExperience({
    required this.position,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.achievements,
  });
}

class Review {
  final String clientName; // Client name
  final String clientImage; // Client profile image
  final double rating; // Rating (0-5)
  final String comment; // Review comment
  final String date; // Review date
  final String projectTitle; // Project title
  final double projectAmount; // Project cost

  const Review({
    required this.clientName,
    required this.clientImage,
    required this.rating,
    required this.comment,
    required this.date,
    required this.projectTitle,
    required this.projectAmount,
  });
}

class Certificate {
  final String name; // Certificate name
  final String issuer; // Issuing organization
  final String date; // Issue date
  final String validUntil; // Expiry date (if applicable)
  final String credentialUrl; // Verification URL
  final String credentialId; // Certificate ID

  const Certificate({
    required this.name,
    required this.issuer,
    required this.date,
    required this.validUntil,
    required this.credentialUrl,
    required this.credentialId,
  });
}
