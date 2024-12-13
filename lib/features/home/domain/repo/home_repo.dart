import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

//! what will happen in feature
//* 1 - get all the featured books
//* 2 - get all the news books
// we should convert all what will happens as abstract class with functions
abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}
