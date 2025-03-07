class ApiConstant {
  // Bases
  static const String baseUrl = 'https://manfaz-production.up.railway.app/';
  static const String userToken = '';

  // EntPoints
  static const String epLogin = 'auth/login';
  static const String epSignUp = 'auth/register';
  static const String epHomeTap = 'categories';
  static const String epGetServicesBasedOnCategory = 'services';
  static const String epResendVerificationCode = 'auth/resend-verification-code';
  static const String epWorkerList = 'workers';
  static const String epServiceParameters = 'service-parameters';
}
