abstract final class AppRoutes {
  static const authGroupPath = '/auth';
  static const loginPath = '$authGroupPath/login';
  static const registerPath = '$authGroupPath/register';

  static const forgetPasswordPath = '$authGroupPath/forget-password';
  static const resetPassword = '$authGroupPath/reset-password';
  static const resetSuccess = '$authGroupPath/reset-success';

  static const accountTypePath = "$authGroupPath/account-type";
}
