import 'package:bookly_app/core/service/api_services.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books_data.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    Map<String, dynamic> data = await apiServices.get(
        endpoint: 'volumes?q=programming&Filtering=free-ebooks');
    List<BookEntity> books = getBoxList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    Map<String, dynamic> data = await apiServices.get(
        endpoint: 'volumes?q=programming&Filtering=free-ebooks&sorting=newest');
    List<BookEntity> books = getBoxList(data);
    saveBooksData(books, kNewestdBox);
    return books;
  }

  List<BookEntity> getBoxList(Map<String, dynamic> data) {
    // book.addAll(data['items'].map((e) => BookModel.fromJson(e)));
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
