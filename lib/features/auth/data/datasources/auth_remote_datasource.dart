import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> register({
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
  Future<void> logout();
  Future<AuthModel> refreshToken(String refreshToken);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  static const baseUrl = 'http://depiplatform.runasp.net/api';

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthModel> login(String email, String password) async {
    final response = await dio.post(
      '$baseUrl/auth/login',
      data: {'email': email, 'password': password},
    );
    print(response.data);
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<AuthModel> register({
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
    final response = await dio.post(
      '$baseUrl/auth/register',
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'userType': userType,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'countryId': countryId,
      },
    );
    print(response.data);
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    await dio.post('$baseUrl/auth/logout');
  }

  @override
  Future<AuthModel> refreshToken(String refreshToken) async {
    final response = await dio.post(
      '$baseUrl/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    print(response.data);
    return AuthModel.fromJson(response.data);
  }
}
