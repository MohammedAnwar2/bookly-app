part of 'featured_book_cubit.dart';

@immutable
sealed class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {
  @override
  String toString() => 'Initial State';
}

final class FeaturedBookLoading extends FeaturedBookState {
  @override
  String toString() => 'Loading State';
}

final class FeaturedBookPaginationLoading extends FeaturedBookState {
  @override
  String toString() => 'Pagination Loading State';
}

final class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String errorMessage;

  FeaturedBookPaginationFailure(this.errorMessage);
  @override
  String toString() => 'Pagination Failure State';
}

final class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> bookList;
  FeaturedBookSuccess(this.bookList);
  @override
  String toString() => 'Success State';
}

final class FeaturedBookFailure extends FeaturedBookState {
  final String errorMessage;

  FeaturedBookFailure(this.errorMessage);
  @override
  String toString() => 'Failure State';
}
