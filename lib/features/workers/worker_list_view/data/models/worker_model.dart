class WorkerModel {
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
  });
}
