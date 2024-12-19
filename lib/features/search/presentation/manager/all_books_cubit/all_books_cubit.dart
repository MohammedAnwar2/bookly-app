import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/usecases/fetch_all_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'all_books_state.dart';

class GetAllBooksCubit extends Cubit<AllBooksState> {
  final FetchAllBooksUseCase fetchAllBooksUseCase;
  List<BookEntity> booksLit = [];
  GetAllBooksCubit(this.fetchAllBooksUseCase) : super(AllBooksInitial()) {
    fetchAllBooks();
  }
  Future<void> fetchAllBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(AllBooksLoading());
    } else {
      emit(AllBooksPaginationLoading());
    }
    var data = await fetchAllBooksUseCase.call(pageNumber);
    data.fold((failure) {
      if (pageNumber == 0) {
        emit(AllBooksFailure(failure.message));
      } else {
        emit(AllBooksPaginationFailure(failure.message));
      }
    }, (booksList) {
      booksLit.addAll(booksList);
      emit(AllBooksSuccess());
    });
  }
}
