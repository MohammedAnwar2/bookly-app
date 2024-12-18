import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/error/error.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchAllBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSpecificBooks(
      {String title = ''});
}
