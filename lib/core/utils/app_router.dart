import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view_details.dart';
import 'package:bookly_app/features/splash/presentation/view/splash_view.dart';
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
        builder: (context, state) => const HomeViewDetails(),
      ),
    ],
  );
}
