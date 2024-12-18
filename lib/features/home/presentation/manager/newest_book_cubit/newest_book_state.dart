part of 'newest_book_cubit.dart';

@immutable
sealed class NewestBookState {}

final class NewestBookInitial extends NewestBookState {
  @override
  String toString() => 'Initial State';
}

final class NewestBookLoading extends NewestBookState {
  @override
  String toString() => 'Loading State';
}

final class NewestBookPaginationLoading extends NewestBookState {
  @override
  String toString() => 'Pagination Loading State';
}

final class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> booksList;

  NewestBookSuccess(this.booksList);
  @override
  String toString() => 'Success State';
}

final class NewestBookFailure extends NewestBookState {
  final String errorMessage;

  NewestBookFailure(this.errorMessage);

  @override
  String toString() => 'Failure State';
}

final class NewestBookPaginationFailure extends NewestBookState {
  final String errorMessage;

  NewestBookPaginationFailure(this.errorMessage);

  @override
  String toString() => 'Pagination Failure State';
}
