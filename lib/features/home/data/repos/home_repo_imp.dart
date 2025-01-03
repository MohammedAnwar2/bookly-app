import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books_data.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {required int pageNumer}) async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumer);
      if (booksList.isNotEmpty) {
        return Either.right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumer);
      saveBooksData(booksList, kFeaturedBox);
      return Either.right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Either.left(ServerFailure.fromDioError(e));
      }
      return Either.left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {required int pageNumer}) async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumer);
      if (booksList.isNotEmpty) {
        return Either.right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumer);
      saveBooksData(booksList, kNewestdBox);
      return Either.right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Either.left(ServerFailure.fromDioError(e));
      }
      return Either.left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required int pageNumer}) async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchSimilarBooks(pageNumber: pageNumer);

      if (booksList.isNotEmpty) {
        return Either.right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchSimilarBooks(pageNumber: pageNumer);
      saveBooksData(booksList, kSimilarBox);
      return Either.right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Either.left(ServerFailure.fromDioError(e));
      }
      return Either.left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required int category}) async{
  //       try {
  //     List<BookEntity> booksList;
  //     booksList = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumer);
  //     if (booksList.isNotEmpty) {
  //       return Either.right(booksList);
  //     }
  //     booksList =
  //         await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumer);
  //     return Either.right(booksList);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return Either.left(ServerFailure.fromDioError(e));
  //     }
  //     return Either.left(ServerFailure(e.toString()));
  //   }
  // }
}
