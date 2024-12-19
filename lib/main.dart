import 'package:bookly_app/core/service/initialization_service.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializationService.initialize();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
            FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImp>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit(
            FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImp>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColors.primaryColor,
              appBarTheme:
                  AppBarTheme(backgroundColor: AppColors.primaryColor)),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router),
    );
  }
}
