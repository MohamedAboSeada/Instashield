import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/pages/login_page.dart';
import '../../features/auth/presentation/view/pages/register_page.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: AppRoutes.loginPath,
    routes: [
      GoRoute(
        path: AppRoutes.loginPath,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text("Login"))),
      ),
      GoRoute(
        path: AppRoutes.registerPath,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text("register"))),
      ),
    ],
  );
}
