import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/features/search/data/datasources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:bookly_app/features/search/domain/repositories/search_repo.dart';
import 'package:dio/dio.dart';

class SearchRepoImp extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;
  SearchRepoImp(
      {required this.searchRemoteDataSource,
      required this.searchLocalDataSource});

  @override
  Future<Either<Failure, List<SearchBookEntities>>> fetchAllBooks() async {
    List<SearchBookEntities> books = [];
    try {
      books = searchLocalDataSource.fetchAllBooks();
      if (books.isNotEmpty) {
        return Either.right(books);
      }
      books = await searchRemoteDataSource.fetchAllBooks();
      return Either.right(books);
    } catch (e) {
      if (e is DioException) {
        return Either.left(ServerFailure.fromDioError(e));
      }
      return Either.left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchBookEntities>>> searchSpecificBooks() {
    // TODO: implement searchSpecificBooks
    throw UnimplementedError();
  }
}
