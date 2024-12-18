import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/features/search/data/datasources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/domain/repositories/search_repo.dart';
import 'package:dio/dio.dart';

class SearchRepoImp extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;
  SearchRepoImp(
      {required this.searchRemoteDataSource,
      required this.searchLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchAllBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books = [];
    try {
      books = searchLocalDataSource.fetchAllBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return Either.right(books);
      }
      books =
          await searchRemoteDataSource.fetchAllBooks(pageNumber: pageNumber);
      return Either.right(books);
    } catch (e) {
      if (e is DioException) {
        return Either.left(ServerFailure.fromDioError(e));
      }
      return Either.left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSpecificBooks(
      {String title = ''}) async {
    try {
      List<BookEntity> books =
          await searchRemoteDataSource.fetchSpecificBooks(title: title);
      return Either.right(books);
    } catch (e) {
      if (e is DioException) {
        return Either.left(ServerFailure.fromDioError(e));
      }
      return Either.left(ServerFailure(e.toString()));
    }
  }
}
