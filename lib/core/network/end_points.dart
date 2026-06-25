class EndPoints {
  static const String baseUrl = 'http://depiplatform.runasp.net/api/';

  // Auth
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';
  static const String refreshToken = 'auth/refresh';
  static const String forgotPassword = 'auth/forgot-password';
  static const String resetPassword = 'auth/reset-password';
  static const String changePassword = 'auth/change-password';
  static const String me = 'auth/me';
}

class ApiKey {
  static const String status = 'status';
  static const String errorMessage = 'message';
  static const String token = 'token';
}
