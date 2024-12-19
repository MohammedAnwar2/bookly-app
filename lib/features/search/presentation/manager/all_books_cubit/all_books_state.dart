part of 'all_books_cubit.dart';

abstract class AllBooksState {
  const AllBooksState();
}

class AllBooksInitial extends AllBooksState {}

class AllBooksLoading extends AllBooksState {}

class AllBooksPaginationLoading extends AllBooksState {}

class AllBooksSuccess extends AllBooksState {}

class AllBooksFailure extends AllBooksState {
  final String errorMessage;

  AllBooksFailure(this.errorMessage);
}

class AllBooksPaginationFailure extends AllBooksState {
  final String errorMessage;

  AllBooksPaginationFailure(this.errorMessage);
}
