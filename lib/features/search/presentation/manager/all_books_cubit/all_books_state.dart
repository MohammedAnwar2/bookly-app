part of 'search_cubit.dart';

abstract class AllBooksState {
  const AllBooksState();
}

class AllBooksInitial extends AllBooksState {}

class AllBooksLoading extends AllBooksState {}

class AllBooksSuccess extends AllBooksState {
  final List<SearchBookEntities> books;

  AllBooksSuccess(this.books);
}

class AllBooksFailure extends AllBooksState {
  final String errorMessage;

  AllBooksFailure(this.errorMessage);
}
