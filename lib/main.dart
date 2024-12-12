import 'package:bookly_app/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppColors.primaryColor),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
