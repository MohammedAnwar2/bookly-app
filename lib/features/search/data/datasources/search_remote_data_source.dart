import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/utils/shared/models/book_model/book_model.dart';
import 'package:bookly_app/core/service/api_services.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books_data.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchAllBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSpecificBooks({String title = ''});
}

class SearchRemoteDataSourceImp extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<BookEntity>> fetchAllBooks({int pageNumber = 0}) async {
    String endpoint =
        'volumes?q=computer&Filtering=free-ebooks&startIndex=${pageNumber * 10}';
    Map<String, dynamic> data = await apiServices.get(endpoint: endpoint);
    List<BookEntity> books = _getSearchBooks(data);
    saveBooksData(books, kSearchBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSpecificBooks({String title = ''}) async {
    String encodedTitle = Uri.encodeComponent("intitle:$title");
    String endpoint = "volumes?q=$encodedTitle&filter=free-ebooks";
    Map<String, dynamic> data = await apiServices.get(endpoint: endpoint);
    List<BookEntity> books = _getSearchBooks(data);
    saveBooksData(books, kSearchBox);
    return books;
  }

  List<BookEntity> _getSearchBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
