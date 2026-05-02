class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.userType,
    required super.isEmailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        userType: json['user_type'],
        isEmailVerified: json['is_email_verified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'user_type': userType,
        'is_email_verified': isEmailVerified,
      };
}