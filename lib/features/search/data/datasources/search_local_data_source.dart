import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchAllBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSpecificBooks({String title = ''});
}

class SearchLocalDataSourceImp extends SearchLocalDataSource {
  SearchLocalDataSourceImp();
  @override
  List<BookEntity> fetchAllBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kSearchBox);
    int length = box.values.length;
    // Ensure the startIndex is within the valid range
    if (startIndex < 0 || startIndex >= length) {
      return []; // Return empty list if startIndex is out of range
    } else {
      // Adjust the endIndex if it exceeds the list length
      if (endIndex > length) {
        endIndex = length; // Adjust endIndex to the list length
      }
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  Future<List<BookEntity>> fetchSpecificBooks({String title = ''}) {
    // TODO: implement fetchSpecificBooks
    throw UnimplementedError();
  }
}
