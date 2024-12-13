import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: AppColors.primaryColor),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router
        // home: const SplashView(),
        );
  }
}
