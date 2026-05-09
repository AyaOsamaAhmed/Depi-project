import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.fullName,
    required super.userType,
    required super.status,
    required super.gender,
    required super.isIdentityVerified,
    required super.isEmailVerified,
    required super.isPhoneVerified,
    required super.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        fullName: json['fullName'],
        userType: json['userType'],
        status: json['status'],
        gender: json['gender'],
        isIdentityVerified: json['isIdentityVerified'] ?? false,
        isEmailVerified: json['isEmailVerified'] ?? false,
        isPhoneVerified: json['isPhoneVerified'] ?? false,
        roles: List<String>.from(json['roles'] ?? []),
      );
}