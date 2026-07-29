class JobOfferModel {
  const JobOfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.salary,
    required this.duration,
    required this.phone,
    required this.authorId,
    required this.authorName,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String location;
  final String? salary;
  final String duration;
  final String phone;
  final String authorId;
  final String authorName;
  final DateTime createdAt;

  factory JobOfferModel.fromJson(Map<String, dynamic> json, String id) {
    return JobOfferModel(
      id: id,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      salary: json['salary'] as String?,
      duration: json['duration'] as String,
      phone: json['phone'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'salary': salary,
      'duration': duration,
      'phone': phone,
      'authorId': authorId,
      'authorName': authorName,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
