import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../models/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthData(AuthModel auth);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearAuthData();
  Future<void> saveOnBoardingSeen();
  Future<bool> isOnBoardingSeen();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  // Keys
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _expiresAtKey = 'expires_at';
  static const _userIdKey = 'user_id';
  static const _userEmailKey = 'user_email';
  static const _userTypeKey = 'user_type';
  static const _userFullNameKey = 'user_full_name';
  static const _onboardingSeenKey = 'onboarding_seen';

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveAuthData(AuthModel auth) async {
    await _storage.write(key: _accessTokenKey, value: auth.accessToken);
    await _storage.write(key: _refreshTokenKey, value: auth.refreshToken);
    await _storage.write(key: _expiresAtKey, value: auth.expiresAt);
    await _storage.write(key: _userIdKey, value: auth.user.id);
    await _storage.write(key: _userEmailKey, value: auth.user.email);
    await _storage.write(
      key: _userTypeKey,
      value: auth.user.userType.toString(),
    );
    await _storage.write(key: _userFullNameKey, value: auth.user.fullName);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> clearAuthData() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> saveOnBoardingSeen() async {
    await _storage.write(key: _onboardingSeenKey, value: 'true');
  }

  @override
  Future<bool> isOnBoardingSeen() async {
    final value = await _storage.read(key: _onboardingSeenKey);
    return value == 'true';
  }
}
