import 'package:bookly_app/features/search/domain/entities/search_book_entities.dart';
import 'package:bookly_app/features/search/domain/usecases/fetch_all_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'all_books_state.dart';

class GetAllBooksCubit extends Cubit<AllBooksState> {
  final FetchAllBooksUseCase fetchAllBooksUseCase;
  GetAllBooksCubit(this.fetchAllBooksUseCase) : super(AllBooksInitial()) {
    fetchAllBooks();
  }
  Future<void> fetchAllBooks() async {
    emit(AllBooksLoading());
    var data = await fetchAllBooksUseCase.call();
    data.fold((failure) {
      emit(AllBooksFailure(failure.message));
    }, (booksList) {
      emit(AllBooksSuccess(booksList));
    });
  }
}
