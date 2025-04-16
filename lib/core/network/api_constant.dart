class ApiConstant {
  // Bases
  static const String baseUrl = 'https://manfaz.fly.dev/';

  // EntPoints
  static const String epLogin = 'auth/login';
  static const String epSignUp = 'auth/register';
  static const String epHomeTap = 'categories';
  static const String epGetServicesBasedOnCategory = 'services';
  static const String epResendVerificationCode =
      'auth/resend-verification-code';
  static const String epWorkerList = 'workers';
  static const String epServiceParameters = 'service-parameters';
  static const String epOrder = 'orders';
  static const String epStore = 'stores';
  static const String epStoreSubCategories = 'stores/categories/all';
  static const String epGetUsers = 'users';
  static const String epSaveUserLocation = 'locations';
}
