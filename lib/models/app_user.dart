class AppUserModel {
  const AppUserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userType,
    required this.createdAt,
  });

  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String userType;
  final DateTime createdAt;

  String get fullName => '$firstName $lastName';

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      userType: json['userType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'userType': userType,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
