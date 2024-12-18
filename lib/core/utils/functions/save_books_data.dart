import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String booksName) {
  var box = Hive.box<BookEntity>(booksName);
  box.addAll(books);
}

// void saveSearchBooksData(List<BookEntity> books, String booksName) {
//   var box = Hive.box<BookEntity>(booksName);
//   box.addAll(books);
// }
