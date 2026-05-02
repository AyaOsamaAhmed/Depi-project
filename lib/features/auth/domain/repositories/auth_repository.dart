import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginWithEmail(String email, String password);
  Future<Either<Failure, User>> registerWithEmail({
    required String email,
    required String password,
    required String name,
    required String userType,
  });
  Future<Either<Failure, void>> logout(String sessionId);
  Future<Either<Failure, void>> verifyEmail(String token);
  Future<Either<Failure, void>> requestPasswordReset(String email);
}