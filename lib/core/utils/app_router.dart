import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view_details.dart';
import 'package:bookly_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
abstract class AppRouter {
  static const String homeView = '/home_view';
  static const String homeViewDetails = '/home_view_details';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: homeViewDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBookCubit(
              FetchSimilardBooksUseCase(homeRepo: getIt.get<HomeRepoImp>())),
          child: HomeViewDetails(
            book: state.extra as BookEntity,
          ),
        ),
      ),
    ],
  );
}
