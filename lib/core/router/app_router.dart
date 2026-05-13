import 'package:go_router/go_router.dart';
import 'package:instashield_app_final/features/auth/presentation/view/pages/login_page.dart';
import 'package:instashield_app_final/features/auth/presentation/view/pages/register_page.dart';

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
    ],
  );
}
