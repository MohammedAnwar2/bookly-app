import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchBookEntities>>> fetchAllBooks();
  Future<Either<Failure, List<SearchBookEntities>>> searchSpecificBooks();
}
