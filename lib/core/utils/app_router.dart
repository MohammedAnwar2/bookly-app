import 'package:bookly_app/core/service/api_services.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case.dart/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view_details.dart';
import 'package:bookly_app/features/search/data/datasources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/data/repositories/search_repo_imp.dart';
import 'package:bookly_app/features/search/domain/usecases/fetch_all_books.dart';
import 'package:bookly_app/features/search/domain/usecases/search_specific_books.dart';
import 'package:bookly_app/features/search/presentation/manager/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/text_input_cubit/text_input_cubit.dart';
import 'package:bookly_app/features/search/presentation/pages/search_view.dart';
import 'package:bookly_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
abstract class AppRouter {
  static const String homeView = '/home_view';
  static const String homeViewDetails = '/home_view_details';
  static const String searchView = '/search_view';
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
      GoRoute(
        path: searchView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetAllBooksCubit(
                FetchAllBooksUseCase(
                  searchRepo: getIt.get<SearchRepoImp>(),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => SearchCubit(
                fetchSpecificsBooksUseCase: FetchSpecificBooksUseCase(
                    searchRepo: getIt.get<SearchRepoImp>()),
              ),
            ),
            BlocProvider(create: (context) => TextInputCubit())
          ],
          child: const SearchView(),
        ),
      ),
    ],
  );
}
