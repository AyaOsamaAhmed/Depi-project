import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required int userType,
    required int gender,
    required String dateOfBirth,
    required String phoneNumber,
    required int countryId,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, AuthEntity>> refreshToken(String refreshToken);

  Future<String?> getSavedToken();
}