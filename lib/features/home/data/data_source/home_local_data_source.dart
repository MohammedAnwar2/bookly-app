import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 20;
    int endIndex = (pageNumber + 1) * 20;
    var box = Hive.box<BookEntity>(kFeaturedBox);
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
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 20;
    int endIndex = (pageNumber + 1) * 20;
    var box = Hive.box<BookEntity>(kNewestdBox);
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
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    var box = Hive.box<BookEntity>(kSimilarBox);
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
}
