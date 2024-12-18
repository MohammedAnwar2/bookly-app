import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String booksName) {
  var box = Hive.box<BookEntity>(booksName);
  box.addAll(books);
}

void saveSearchBooksData(List<SearchBookEntities> books, String booksName) {
  var box = Hive.box<SearchBookEntities>(booksName);
  box.addAll(books);
}
