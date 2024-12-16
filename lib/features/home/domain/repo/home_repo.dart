import 'package:bookly_app/core/class/either_class.dart';
import 'package:bookly_app/core/error/error.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

//! what will happen in feature
//* 1 - get all the featured books
//* 2 - get all the news books
// we should convert all what will happens as abstract class with functions
abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {required int pageNumer});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
