part of 'newest_book_cubit.dart';

@immutable
sealed class NewestBookState {}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoading extends NewestBookState {}

final class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> booksList;

  NewestBookSuccess(this.booksList);
}

final class NewestBookFailure extends NewestBookState {
  final String errorMessage;

  NewestBookFailure(this.errorMessage);
}
