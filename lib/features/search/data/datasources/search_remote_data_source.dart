import 'package:bookly_app/core/service/api_services.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books_data.dart';
import 'package:bookly_app/features/search/data/models/search_book_model/search_book_model.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchBookEntities>> fetchAllBooks();
  // Future <List<SearchBookEntities>> searchSpecificBooks();
}

class SearchRemoteDataSourceImp extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<SearchBookEntities>> fetchAllBooks() async {
    String endpoint = 'volumes?q=computer&Filtering=free-ebooks';
    Map<String, dynamic> data = await apiServices.get(endpoint: endpoint);
    List<SearchBookEntities> books = _getSearchBooks(data);
    saveSearchBooksData(books, kSearchBox);
    return books;
  }

  List<SearchBookEntities> _getSearchBooks(Map<String, dynamic> data) {
    List<SearchBookEntities> books = [];
    for (var item in data['items']) {
      books.add(SearchBookModel.fromJson(item));
    }
    return books;
  }
}
