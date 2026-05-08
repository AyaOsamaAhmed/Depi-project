class AuthModel extends AuthEntity {
  const AuthModel({
    required super.accessToken,
    required super.refreshToken,
    required super.expiresAt,
    required super.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        expiresAt: json['expiresAt'],
        user: UserModel.fromJson(json['user']),
      );
}