part of 'similar_book_cubit.dart';

@immutable
sealed class SimilarBookState {}

final class SimilarBookInitial extends SimilarBookState {}

final class SimilarBookLoading extends SimilarBookState {}

final class SimilarBookSuccess extends SimilarBookState {
  final List<BookEntity> books;

  SimilarBookSuccess(this.books);
}

final class SimilarBookFailure extends SimilarBookState {
  final String errorMessage;

  SimilarBookFailure(this.errorMessage);
}

final class SimilarBookPaginationLoading extends SimilarBookState {}

final class SimilarBookPaginationFailure extends SimilarBookState {
  final String errorMessage;

  SimilarBookPaginationFailure(this.errorMessage);
}
