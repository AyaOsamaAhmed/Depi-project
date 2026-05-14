class UserEntity {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String fullName;
  final int userType;
  final int status;
  final int gender;
  final bool isIdentityVerified;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final List<String> roles;

  const UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.userType,
    required this.status,
    required this.gender,
    required this.isIdentityVerified,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.roles,
  });
}