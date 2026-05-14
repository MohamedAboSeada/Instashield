import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/pages/account_type_page.dart';
import '../../features/auth/presentation/view/pages/forget_password_page.dart';
import '../../features/auth/presentation/view/pages/login_page.dart';
import '../../features/auth/presentation/view/pages/register_page.dart';
import '../../features/auth/presentation/view/pages/reset_password_page.dart';
import '../../features/auth/presentation/view/pages/reset_success_page.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: AppRoutes.loginPath,
    routes: [
      GoRoute(
        path: AppRoutes.loginPath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.registerPath,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordPath,
        builder: (context, state) => const ForgetPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.resetSuccess,
        builder: (context, state) => const ResetSuccessPage(),
      ),
      GoRoute(
        path: AppRoutes.accountTypePath,
        builder: (context, state) => const AccountTypePage(),
      ),
    ],
  );
}
