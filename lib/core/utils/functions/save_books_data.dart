import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String booksName) {
  var box = Hive.box(booksName);
  box.addAll(books);
}
