class User {
  final String id;
  final String name;
  final String email;
  final String userType; // freelancer, client, admin
  final bool isEmailVerified;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.isEmailVerified,
  });
}