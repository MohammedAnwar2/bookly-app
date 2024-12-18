import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<SearchBookEntities> fetchAllBooks();
  // Future <List<SearchBookEntities>> searchSpecificBooks();
}

class SearchLocalDataSourceImp extends SearchLocalDataSource {
  SearchLocalDataSourceImp();
  @override
  List<SearchBookEntities> fetchAllBooks() {
    var box = Hive.box<SearchBookEntities>(kSearchBox);
    return box.values.toList();
  }
}
