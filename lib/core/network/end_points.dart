class EndPoints {
  static const String baseUrl = 'https://depiplatform.runasp.net/api';

  // Auth
  static const String apiLogin = '$baseUrl/auth/login';
  static const String apiRegister = '$baseUrl/auth/register';
  static const String apiLogout = '$baseUrl/auth/logout';
  static const String apiRefreshToken = '$baseUrl/auth/refresh';
  static const String apiForgotPassword = '$baseUrl/auth/forgot-password';
  static const String apiResetPassword = '$baseUrl/auth/reset-password';
  static const String apiChangePassword = '$baseUrl/auth/change-password';
  static const String apiMe = '$baseUrl/auth/me';
  static const String apiResendVerification =
      '$baseUrl/auth/resend-verification';

  // ****************   freelancer    ****************

  // jobs
  static const String apiJobsMatches = '$baseUrl/ai/jobs/matches';
  static const String apiCategories = '$baseUrl/categories';
}

class ApiKey {
  static const String status = 'status';
  static const String errorMessage = 'message';
  static const String token = 'token';
}
