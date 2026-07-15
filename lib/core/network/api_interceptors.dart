import 'package:dio/dio.dart';
import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';

class ApiInterceptor extends Interceptor {
  final AuthLocalDataSource _authLocalDataSource;

  ApiInterceptor(this._authLocalDataSource);
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    String? token = await _authLocalDataSource.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
