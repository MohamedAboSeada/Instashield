import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/extensions/context_extensions.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 850),
      minTextAdapt: false,
      builder: (context, _) {
        return MaterialApp.router(
          themeMode: .dark,
          darkTheme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routerConfig,
          // preserve text from scale very large
          // or become very small
          builder: (context, child) {
            final mediaQuery = context.mediaQuery;
            final systemScale = mediaQuery.textScaler.scale(1);
            final clampedScale = systemScale.clamp(0.9, 1.3);

            return MediaQuery(
              data: mediaQuery.copyWith(
                textScaler: TextScaler.linear(clampedScale),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
