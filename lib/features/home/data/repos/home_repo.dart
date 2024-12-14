import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Fiauler, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return Either.right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks();
      return Either.right(booksList);
    } catch (e) {
      return Either.left(Fiauler());
    }
  }

  @override
  Future<Either<Fiauler, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return Either.right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchNewestBooks();
      return Either.right(booksList);
    } catch (e) {
      return Either.left(Fiauler());
    }
  }
}
