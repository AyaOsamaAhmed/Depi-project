import 'package:dipe_freelance/features/auth/data/models/auth_model.dart';
import 'package:dipe_freelance/features/auth/domain/entities/user_entity.dart';

class AuthEntity {
  final String accessToken;
  final String refreshToken;
  final String expiresAt;
  final UserEntity user;

  const AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.user,
  });

  AuthModel toModel() {
    return AuthModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
      user: user,
    );
  }
}
