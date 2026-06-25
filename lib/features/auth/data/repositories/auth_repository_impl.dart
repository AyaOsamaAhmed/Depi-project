import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dipe_freelance/core/errors/exceptions.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/failures/failure.dart' hide Failure, ServerFailure;
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  // ─── Helper ───────────────────────────────────────────
  Object _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final message = e.response?.data?['error'] as String?;

    switch (statusCode) {
      case 400:
        return ServerFailure(message ?? 'طلب غير صحيح') as Failure;
      case 401:
        return AuthFailure(message ?? 'غير مصرح، سجل دخول مرة تانية')
            as Failure;
      case 404:
        return ServerFailure(message ?? 'المورد مش موجود') as Failure;
      case 500:
        return ServerFailure(message ?? 'خطأ في السيرفر، حاول بعدين')
            as Failure;
      default:
        return NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure;
    }
  }

  // ─── Login ────────────────────────────────────────────
  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(email, password);
      await localDataSource.saveAuthData(result);
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e) as Failure);
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure);
    }
  }

  // ─── Register ─────────────────────────────────────────
  @override
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
  }) async {
    try {
      final result = await remoteDataSource.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        userType: userType,
        gender: gender,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneNumber,
        countryId: countryId,
      );
      await localDataSource.saveAuthData(result);
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e) as Failure);
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure);
    }
  }

  // ─── Logout ───────────────────────────────────────────
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearAuthData();
      return const Right(null);
    } on DioException catch (e) {
      await localDataSource.clearAuthData();
      return Left(_handleDioError(e) as Failure);
    } catch (e) {
      await localDataSource.clearAuthData();
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure);
    }
  }

  // ─── Forgot Password ────────────────────────────────────
  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await remoteDataSource.forgotPassword(email);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioError(e) as Failure);
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure);
    }
  }

  // ─── Resend Verify Email ────────────────────────────────────
  @override
  Future<Either<Failure, void>> resendVerifyEmail(String email) async {
    try {
      await remoteDataSource.resendVerifyEmail(email);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioError(e) as Failure);
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure);
    }
  }

  // ─── Refresh Token ────────────────────────────────────
  @override
  Future<Either<Failure, AuthEntity>> refreshToken(String token) async {
    try {
      final result = await remoteDataSource.refreshToken(token);
      await localDataSource.saveAuthData(result);
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e) as Failure);
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت') as Failure);
    }
  }

  // ─── Get Saved Token ──────────────────────────────────
  @override
  Future<String?> getSavedToken() async {
    return await localDataSource.getAccessToken();
  }
}
