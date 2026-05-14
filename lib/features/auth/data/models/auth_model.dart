import 'package:dipe_freelance/features/auth/data/models/user_model.dart';

import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';



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
        user: UserModel.fromJson(json['user']) as UserEntity,
      );
}