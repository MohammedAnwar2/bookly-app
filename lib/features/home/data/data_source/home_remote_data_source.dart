import 'package:bookly_app/core/service/api_services.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books_data.dart';
import 'package:bookly_app/core/utils/shared/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endpoint:
            'volumes?q=programming&Filtering=free-ebooks&maxResults=20&startIndex=${pageNumber * 20}');
    List<BookEntity> books = getBoxList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endpoint: //Science
            'volumes?q=subject:art&Filtering=free-ebooks&maxResults=20&sorting=newest&startIndex=${pageNumber * 20}');
    List<BookEntity> books = getBoxList(data);
    saveBooksData(books, kNewestdBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endpoint:
            'volumes?q=programming&Filtering=free-ebooks&maxResults=30&sorting=relevance&startIndex=${pageNumber * 30}');
    List<BookEntity> books = getBoxList(data);
    saveBooksData(books, kSimilarBox);
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
