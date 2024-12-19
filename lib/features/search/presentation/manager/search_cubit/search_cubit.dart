import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/usecases/search_specific_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final FetchSpecificBooksUseCase fetchSpecificsBooksUseCase;
  late bool isTyping;
  late bool isLoading;
  SearchCubit({required this.fetchSpecificsBooksUseCase})
      : super(SearchInitial()) {
    isTyping = false;
    isLoading = false;
  }

  fetchSpecificsBooks({required String title}) async {
    emit(SearchLoading());
    var data = await fetchSpecificsBooksUseCase.call(title);
    data.fold(
      (failure) {
        emit(SearchFailure(failure.message));
      },
      (booksList) {
        emit(SearchSuccess(booksList));
      },
    );
  }

  void onSearch(String text) async {
    isTyping = text.isNotEmpty;
    if (isTyping) {
      if (!isLoading) {
        isLoading = true;
        await fetchSpecificsBooks(title: text);
        isLoading = false;
      }
    } else {
      emit(SearchIsNotTyping());
    }
  }
}
