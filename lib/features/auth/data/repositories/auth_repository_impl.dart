import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  // ─── Helper ───────────────────────────────────────────
  Failure _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final message = e.response?.data?['error'] as String?;

    switch (statusCode) {
      case 400:
        return ServerFailure(message ?? 'طلب غير صحيح');
      case 401:
        return AuthFailure(message ?? 'غير مصرح، سجل دخول مرة تانية');
      case 404:
        return ServerFailure(message ?? 'المورد مش موجود');
      case 500:
        return ServerFailure(message ?? 'خطأ في السيرفر، حاول بعدين');
      default:
        return NetworkFailure('تأكد من الاتصال بالإنترنت');
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
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت'));
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
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت'));
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
      return Left(_handleDioError(e));
    } catch (e) {
      await localDataSource.clearAuthData();
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت'));
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
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(NetworkFailure('تأكد من الاتصال بالإنترنت'));
    }
  }

  // ─── Get Saved Token ──────────────────────────────────
  @override
  Future<String?> getSavedToken() async {
    return await localDataSource.getAccessToken();
  }
}